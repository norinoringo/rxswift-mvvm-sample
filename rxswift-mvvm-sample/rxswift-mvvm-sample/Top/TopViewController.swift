//
//  TopViewController.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/24.
//  

import UIKit
import RxSwift
import RxCocoa

class TopViewController:BaseViewController {
    typealias ViewModel = TopViewModel
    typealias TableData = ViewModel.CellData

    @IBOutlet weak var tableView: UITableView!

    let tableData = Observable<[TableData]>.just([TableData(functionName: "GitHubリポジトリ検索", cellType: .serachRepository),
                                                  TableData(functionName: "GitHub人気リポジトリ表示", cellType: .searchHighRatedRepository)])

    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBar()
        bind()
    }

    private func bind() {
        tableData.bind(to: tableView.rx.items(cellIdentifier: "TopViewCell",
                                              cellType: TopViewCell.self)) { row, element, cell in
            cell.configure(cellData: element)
        }
        .disposed(by: disposeBag)

        tableView.rx.itemSelected
            .subscribe(onNext: { indexPath in
                print(indexPath.row)
            })
            .disposed(by: disposeBag)

        // TODO: 画面遷移
        tableView.rx.modelSelected(TableData.self)
            .subscribe(onNext: { cellData in
                switch cellData.cellType {
                case .serachRepository:
                    print(cellData.cellType)
                    let nextStoryboard = UIStoryboard(name: "SearchRepository", bundle: nil)
                    let nextView = nextStoryboard.instantiateViewController(withIdentifier: "SearchRepository")
                    self.navigationController?.pushViewController(nextView, animated: true)
                case .searchHighRatedRepository:
                    print(cellData.cellType)
                }
            })
            .disposed(by: disposeBag)

        /*
         RxSwiftでTableViewCellの高さを設定する
         https://github.com/RxSwiftCommunity/RxDataSources/issues/124
         */
        self.tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }

    private func configureTableView() {
        tableView.register(UINib(nibName: "TopViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "TopViewCell")
    }

    private func configureNavigationBar() {
        self.configureNavigationItem(title: "RxSwift×MVVMアプリ")
        self.hideBackButton()
    }
}


extension TopViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
