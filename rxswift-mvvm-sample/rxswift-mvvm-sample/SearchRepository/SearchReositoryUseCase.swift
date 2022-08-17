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
    func fetchRepository(keyword: String?) -> Driver<[GitHubRepositoryItems]>
}

class FetchRepositoryUseCase:FetchRepositoryProtocol {

    private var disposeBag = DisposeBag()

    var tableDataRelay = BehaviorRelay<[GitHubRepositoryItems]>(value: [])

    func fetchRepository(keyword: String?) -> Driver<[GitHubRepositoryItems]> {

        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(keyword ?? "")") else { return tableDataRelay.asDriver()}
        let urlRequest = URLRequest(url: url)

        URLSession.shared.rx.response(request: urlRequest)
            .subscribe { [weak self] response, data in
                guard let repositories = try? JSONDecoder().decode(GitHubRepositoryModel.self, from: data) else {
                    return
                }

                var data:[GitHubRepositoryItems] = []
                for i in 0 ..< repositories.items.count {
                    data.append(repositories.items[i])
                }

                self?.tableDataRelay.accept(data)
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)
        return tableDataRelay.asDriver()
    }
}
