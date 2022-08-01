//
//  SearchRepositoryViewModel.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/30.
//  

import UIKit
import RxSwift
import RxCocoa

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
