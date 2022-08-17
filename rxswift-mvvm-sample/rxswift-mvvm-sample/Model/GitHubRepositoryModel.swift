//
//  SearchRepositoriesResponseModel.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/08/09.
//  


import Foundation

struct GitHubRepositoryModel:Codable {
    var items: [GitHubRepositoryItems]

    enum CodingKeys: String, CodingKey {
        case items
    }
}
