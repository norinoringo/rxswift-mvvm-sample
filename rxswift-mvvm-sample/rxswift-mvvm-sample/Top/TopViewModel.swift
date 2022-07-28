//
//  TopViewModel.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/24.
//  


import Foundation

class TopViewModel {
    struct Input {}

    struct Output {}

    struct CellData {
        let functionName:String
    }

    init() {}

    func transform(input:Input) -> Output {
        return Output()
    }
}
