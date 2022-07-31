//
//  RepositoryViewCell.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/30.
//  


import Foundation
import UIKit

class RepositoryViewCell:UITableViewCell {

    @IBOutlet weak var repositoryTitleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!

    func configure(data:SearchRepositoryResponseModel) {
        repositoryTitleLabel.text = data.name ?? "未公開"
        discriptionLabel.text = data.description ?? "未公開"
        starLabel.text = "★:\(String(describing: data.stargazersCount))" + "\u{00A0}" + "Language:\(data.language ?? "未公開")"
    }
}
