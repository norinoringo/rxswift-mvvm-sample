//
//  TopViewController.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/24.
//  


import Foundation
import UIKit

class TopViewController:BaseViewController {
    typealias ViewModel = TopViewModel
    typealias TableData = ViewModel.CellData

    @IBOutlet weak var tableView: UITableView!
    
    var tableData = [TableData(functionName: "GitHub検索")]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBar()
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TopViewCell", bundle: nil),
                           forCellReuseIdentifier: "TopViewCell")
    }

    private func configureNavigationBar() {
        self.configureNavigationItem(title: "RxSwift×MVVMアプリ")
        self.hideBackButton()
    }
}

extension TopViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopViewCell",
                                                 for: indexPath) as! TopViewCell
        cell.configure(cellData: tableData[indexPath.row])
        return cell
    }
}

extension TopViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension TopViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
