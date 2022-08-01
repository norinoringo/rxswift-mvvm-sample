//
//  MockSearchRepositoryResponseModel.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/08/02.
//  


import Foundation

class MockSearchRepositoryResponseModel {
    var mockResponse: [SearchRepositoryResponseModel] {
        return [SearchRepositoryResponseModel(name: "swift",
                                              url: "https://github.com/apple/swift",
                                              description: "The Swift Programming Language",
                                              stargazersCount: 60206,
                                              language: "C++"),
                SearchRepositoryResponseModel(name: "swift",
                                              url: "https://github.com/apple/swift",
                                              description: "The Swift Programming Language",
                                              stargazersCount: 60206,
                                              language: "C++"),
                SearchRepositoryResponseModel(name: "swift",
                                              url: "https://github.com/apple/swift",
                                              description: "The Swift Programming Language",
                                              stargazersCount: 60206,
                                              language: "C++")]
    }
}
