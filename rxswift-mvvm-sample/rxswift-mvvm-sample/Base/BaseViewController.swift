//
//  BaseViewController.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/28.
//  


import Foundation
import UIKit

class BaseViewController:UIViewController {

    // UINavigationBarにタイトルを表示する
    func configureNavigationItem(title:String) {
        self.navigationItem.title = title
    }

    // UINavigationControllerの戻るボタンを非表示にする
    func hideBackButton() {
        self.navigationItem.hidesBackButton = true
    }
    // UINavigationControllerの戻るボタンを表示する
    func showBackButton() {
        self.navigationItem.hidesBackButton = false
    }
}
