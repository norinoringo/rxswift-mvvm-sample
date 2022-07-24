//
//  TopViewController.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/24.
//  


import Foundation
import UIKit

class TopViewController:UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let functionNameData:[String] = ["GitHub検索"]

    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }

    private func initTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TopViewCell", bundle: nil), forCellReuseIdentifier: "TopViewCell")
    }
}

extension TopViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return functionNameData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopViewCell", for: indexPath) as! TopViewCell
        cell.functionName.text = functionNameData[indexPath.row]
        return cell
    }


}

extension TopViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension TopViewController {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
