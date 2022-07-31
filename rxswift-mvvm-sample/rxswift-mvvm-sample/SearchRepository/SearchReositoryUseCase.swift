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
