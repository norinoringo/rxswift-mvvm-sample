//
//  SplashViewModel.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/23.
//  


import Foundation

class SplashViewModel {
    struct Input {}
    struct Output{}

    init(input:SplashViewModel.Input) {
        transform(input: input)
    }

    func transform(input:Input) -> Output {
        return Output()
    }
}
