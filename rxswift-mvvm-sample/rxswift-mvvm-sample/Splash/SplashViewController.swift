//
//  SplashViewController.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/23.
//  


import Foundation
import UIKit

class SplashViewController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SplashView画面")

        let nextStoryboard = UIStoryboard(name: "Top", bundle: nil)
        let nextView = nextStoryboard.instantiateViewController(withIdentifier: "Top")
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}
