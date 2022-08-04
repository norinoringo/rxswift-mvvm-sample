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

    private let usecase: FetchRepositoryProtocol

    init(usecase: FetchRepositoryProtocol = FetchRepositoryUseCase()) {
        self.usecase = usecase
    }

    struct Input {
        let searchKeyword: Driver<String?>
        let tapCell: Driver<SearchRepositoryResponseModel>
    }

    struct Output {
        let response: Driver<[SearchRepositoryResponseModel]>
        let openURL: Driver<String?>
    }

    func transform(input:Input) -> Output {

        let response = input.searchKeyword
            .map({ keyword in
                self.usecase.fetchRepository(keyword: keyword)
            })
            .merge() // .mapして.merge = flatMap
        
        let openURL = input.tapCell
            .map({ model in
                return model.url
            }).asDriver(onErrorJustReturn: "")

        return Output(response: response,
                      openURL: openURL)
    }
}
