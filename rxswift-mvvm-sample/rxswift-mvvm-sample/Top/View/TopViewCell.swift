//
//  TopViewCell.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/24.
//  


import Foundation
import UIKit

class TopViewCell:UITableViewCell {
    @IBOutlet weak var functionNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(cellData:TopViewModel.CellData) {
        functionNameLabel.text = cellData.functionName
    }
}
