//
//  UIColor+UIImage.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/30.
//  


import Foundation
import UIKit

extension UIColor {
    func image(size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill() // 色を指定
            rendererContext.fill(.init(origin: .zero, size: size)) // 塗りつぶす
        }
    }
}
