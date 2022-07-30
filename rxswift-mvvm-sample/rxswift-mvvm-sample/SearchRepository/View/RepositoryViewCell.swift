//
//  RepositoryViewCell.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/30.
//  


import Foundation
import UIKit

class RepositoryViewCell:UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var repositoryTitleLabel: UILabel!
    @IBOutlet weak var distributionLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!

    func configure(data:SearchRepositoryViewModel.Data) {
        iconImageView.image = data.iconImage ?? nil
        repositoryTitleLabel.text = data.title ?? "未公開"
        distributionLabel.text = data.distribution ?? "未公開"

        var starText = ""
        starText.append("★:\(data.star ?? "未公開")")
        starText.append("language:\(data.language ?? "未公開")")
        starLabel.text = starText
    }
}
