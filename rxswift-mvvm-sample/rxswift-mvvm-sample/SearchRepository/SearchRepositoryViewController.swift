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

    @IBOutlet weak var saerchBar: UISearchBar!
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

        let searchKeyword = self.saerchBar.rx.text.asDriver()
        let tapCell = self.tableView.rx.modelSelected(SearchRepositoryResponseModel.self).asDriver()

        let input = Input(searchKeyword: searchKeyword,
                          tapCell: tapCell)

        let output = viewModel.transform(input: input)

        output.response
            .drive(self.tableView.rx.items(cellIdentifier: "RepositoryViewCell",
                                           cellType: RepositoryViewCell.self)) { row, element, cell in
                cell.configure(data: element)
            }.disposed(by: disposeBag)


        output.openURL
            .drive(onNext: { url in
                let url = URL(string: url!)
                UIApplication.shared.open(url!)
            }).disposed(by:disposeBag)
    }

        func configureView() {}

        func configureTableView() {
            tableView.register(UINib(nibName: "RepositoryViewCell",
                                     bundle: nil),
                               forCellReuseIdentifier: "RepositoryViewCell")

            self.tableView.rx.setDelegate(self)
                .disposed(by: disposeBag)
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
