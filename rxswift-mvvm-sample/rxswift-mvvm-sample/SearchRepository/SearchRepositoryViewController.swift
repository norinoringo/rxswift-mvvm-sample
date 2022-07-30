//
//  SearchRepositoryViewController.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/30.
//  


import UIKit
import RxSwift
import RxCocoa

class SearchRepositoryViewController:BaseViewController {

    typealias ViewModel = SearchRepositoryViewModel
    typealias TableData = SearchRepositoryViewModel.Data

    @IBOutlet weak var serchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    // let usecase:hogeUsecase!

    let tableData = Observable<[TableData]>.just([TableData(iconImage: UIColor.red.image(size: .init(width: 50, height: 50)), title: "テストタイトル", distribution: "テスト説明", star: "1000", language: "Swift"),
                                                  TableData(iconImage: UIColor.blue.image(size: .init(width: 50, height: 50)), title: "テストタイトル", distribution: "テスト説明", star: "1000", language: "Swift")])

    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationView()
        bind()
    }

    private func bind() {
        tableData.bind(to: tableView.rx.items(cellIdentifier: "RepositoryViewCell",
                                              cellType: RepositoryViewCell.self)) { row, element, cell in
            cell.configure(data: element)
        }.disposed(by: disposeBag)

        self.tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }

    func configureView() {

    }

    func configureTableView() {
        tableView.register(UINib(nibName: "RepositoryViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "RepositoryViewCell")
    }

    func configureNavigationView() {
        configureNavigationItem(title: "GitHubリポジトリ検索画面")
        showBackButton()
    }
}

extension SearchRepositoryViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
}
