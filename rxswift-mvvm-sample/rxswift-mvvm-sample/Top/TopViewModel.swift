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
        let cellType:CellTransisionType

        init(functionName:String,cellType:CellTransisionType) {
            self.functionName = functionName
            self.cellType = cellType
        }
    }
    
    init() {}

    func transform(input:Input) -> Output {
        return Output()
    }
}

enum CellTransisionType {
    case serachRepository,searchHighRatedRepository
}
