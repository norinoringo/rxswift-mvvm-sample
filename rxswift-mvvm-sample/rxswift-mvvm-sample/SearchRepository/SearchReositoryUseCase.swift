//
//  SearchReositoryUseCase.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/30.
//  


import Foundation
import RxSwift
import RxCocoa

protocol FetchRepositoryProtocol {
    func fetchRepository() -> Driver<[SearchRepositoryResponseModel]>
}

enum GitHubServiceError: Error {
    case offline
    case githubLimitReached
    case networkError
}

typealias SearchRepositoriesResposne = Result<(repositories:[SearchRepositoryResponseModel], nextURL: URL?), GitHubServiceError >

class FetchRepositoryUseCase:FetchRepositoryProtocol {

    private let tableDataRelay = BehaviorRelay<[SearchRepositoryResponseModel]>(value: [SearchRepositoryResponseModel(name: "swift",
                                                                                                                      url: "https://github.com/apple/swift",
                                                                                                                      description: "The Swift Programming Language",
                                                                                                                      stargazersCount: 60206,
                                                                                                                      language: "C+")])

    func fetchRepository() -> Driver<[SearchRepositoryResponseModel]> {
        return tableDataRelay.asDriver()
    }
}

extension FetchRepositoryUseCase {
    public func loadSearchURL(searchURL: URL) -> Observable<SearchRepositoriesResposne> {
        return URLSession.shared
            .rx.response(request: URLRequest(url: searchURL)) // URLSessionもRxSwiftで拡張できるのか！
            .retry(3) // 通信失敗しても3回はリトライする
            .observe(on: MainScheduler.instance) // スケジューラーの設定？ここはMainでいいのかよくわからない
            .map { pair -> SearchRepositoriesResposne in // 別のシーケンスに変換したいときは.map ?
                if pair.0.statusCode == 403 {
                    return .failure(.githubLimitReached)
                }

                let jsonRoot = try self.parseJSON(pair.0, data: pair.1)

                guard let json = jsonRoot as? [String: AnyObject] else {
                    throw fatalError()
                }

                let repositories = try self.parse(json)
                let nextURL = try FetchRepositoryUseCase.parseNextURL(pair.0)

                return .success((repositories: repositories, nextURL: nextURL))

            }
    }
}

extension FetchRepositoryUseCase {

    private func parseJSON(_ httpResponse: HTTPURLResponse, data: Data) throws -> AnyObject {
        return try JSONSerialization.jsonObject(with: data, options: []) as AnyObject
    }

    private func parse(_ json: [String: AnyObject]) throws -> [SearchRepositoryResponseModel] {
        guard let items = json["items"] as? [[String: AnyObject]] else {
            throw fatalError("Can't find items")
        }
        return try items.map { item in
            guard let name = item["name"] as? String,
                  let url = item["url"] as? String,
                  let description = item["description"] as? String,
                  let stargazersCount = item["stargazers_count"] as? Int,
                  let language = item["language"] as? String
            else {
                throw fatalError("Can't find items")
            }
            return SearchRepositoryResponseModel(name: name,
                                                 url: url,
                                                 description: description,
                                                 stargazersCount: stargazersCount,
                                                 language: language)
        }
    }

    private static func parseNextURL(_ httpResponse: HTTPURLResponse) throws -> URL? {
        guard let serializedLinks = httpResponse.allHeaderFields["Link"] as? String else {
            return nil
        }

        let links = try self.parseLinks(serializedLinks)

        guard let nextPageURL = links["next"] else {
            return nil
        }

        guard let nextUrl = URL(string: nextPageURL) else {
            throw fatalError("Error parsing next url `\(nextPageURL)`")
        }

        return nextUrl
    }

    private static let parseLinksPattern = "\\s*,?\\s*<([^\\>]*)>\\s*;\\s*rel=\"([^\"]*)\""
    private static let linksRegex = try! NSRegularExpression(pattern: parseLinksPattern, options: [.allowCommentsAndWhitespace])

    private static func parseLinks(_ links: String) throws -> [String: String] {

        let length = (links as NSString).length
        let matches = self.linksRegex.matches(in: links, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: length))

        var result: [String: String] = [:]

        for m in matches {
            let matches = (1 ..< m.numberOfRanges).map { rangeIndex -> String in
                let range = m.range(at: rangeIndex)
                let startIndex = links.index(links.startIndex, offsetBy: range.location)
                let endIndex = links.index(links.startIndex, offsetBy: range.location + range.length)
                return String(links[startIndex ..< endIndex])
            }

            if matches.count != 2 {
                throw fatalError("Error parsing links")
            }

            result[matches[1]] = matches[0]
        }

        return result
    }
}
