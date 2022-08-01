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

    private let tableDataRelay = BehaviorRelay<[SearchRepositoryResponseModel]>(value: MockSearchRepositoryResponseModel().mockResponse)

    func fetchRepository() -> Driver<[SearchRepositoryResponseModel]> {
        return tableDataRelay.asDriver()
    }
}
