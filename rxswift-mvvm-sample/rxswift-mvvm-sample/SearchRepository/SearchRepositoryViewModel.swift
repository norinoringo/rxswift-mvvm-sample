//
//  SearchRepositoryViewModel.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/30.
//  


import Foundation
import UIKit

class SearchRepositoryViewModel {
    struct Input{}

    struct Output{}

    struct Data{
        let title:String?
        let distribution:String?
        let star:String?
        let language:String?
    }

    func transform(input:Input) -> Output {
        return Output()
    }
}
