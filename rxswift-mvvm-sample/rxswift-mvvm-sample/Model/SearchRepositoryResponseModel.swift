//
//  SearchRepositoryResponseModel.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/08/01.
//  


import Foundation

struct SearchRepositoryResponseModel {
    var name: String?
    var url: String?
    var description: String?
    var stargazersCount: Int?
    var language: String?

    init(name: String?, url: String?, description: String?, stargazersCount: Int?, language: String?) {
        self.name = name
        self.url = url
        self.description = description
        self.stargazersCount  = stargazersCount
        self.language = language
    }
}
