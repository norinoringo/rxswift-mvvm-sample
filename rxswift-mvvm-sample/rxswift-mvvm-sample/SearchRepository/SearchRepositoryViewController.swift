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
    typealias Input = ViewModel.Input
    typealias Output = ViewModel.Output

    @IBOutlet weak var serchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    let viewModel = ViewModel()

    private var tableData = [SearchRepositoryResponseModel]()

    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationView()
        bind()
    }

    private func bind() {
        let input = Input()
        let output = viewModel.transform(input: input)

        output.tableData
            .drive(self.tableView.rx.items(cellIdentifier: "RepositoryViewCell",
                                           cellType: RepositoryViewCell.self)) { row, element, cell in
                cell.configure(data: element)
            }.disposed(by: disposeBag)

        self.tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }

    func configureView() {}

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
