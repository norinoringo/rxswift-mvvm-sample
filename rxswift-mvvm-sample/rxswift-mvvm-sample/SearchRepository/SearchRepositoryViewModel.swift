//
//  SearchRepositoryViewModel.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/30.
//  

import UIKit
import RxSwift
import RxCocoa

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

class SearchRepositoryViewModel {

    init(usecase: FetchRepositoryProtocol = FetchRepositoryUseCase()) {
        self.usecase = usecase
    }

    private let usecase: FetchRepositoryProtocol
    
    struct Input {}

    struct Output {
        let tableData: Driver<[SearchRepositoryResponseModel]>
    }

    func transform(input:Input) -> Output {
        let tableData = usecase.fetchRepository()
        return Output(tableData: tableData)
    }
}
