//
//  SearchRepositoryResponseModel.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/08/01.
//  


import Foundation

struct GitHubRepositoryItems:Codable {
    var name: String?
    var url: String?
    var description: String?
    var stargazersCount: Int?
    var language: String?

    enum CodingKeys: String, CodingKey {
        case name
        case url
        case description
        case stargazersCount = "stargazers_count"
        case language
    }
}
