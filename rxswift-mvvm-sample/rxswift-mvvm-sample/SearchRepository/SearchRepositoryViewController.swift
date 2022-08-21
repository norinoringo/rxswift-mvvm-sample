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

    private var tableData = [GitHubRepositoryItems]()

    var indicator = UIActivityIndicatorView()

    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationView()
        configureIndicatorView()
        bind()
    }

    private func bind() {

        let searchKeyword = self.saerchBar.rx.text.orEmpty
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .asDriver(onErrorJustReturn: "")

        let tapCell = self.tableView.rx.modelSelected(GitHubRepositoryItems.self).asDriver()

        let input = Input(searchKeyword: searchKeyword,
                          tapCell: tapCell)

        let output = viewModel.transform(input: input)

        output.response
            .drive(self.tableView.rx.items(cellIdentifier: "RepositoryViewCell",
                                           cellType: RepositoryViewCell.self)) { row, element, cell in
                cell.configure(data: element)
                self.stopIndicator()
            }.disposed(by: disposeBag)


        output.openURL
            .drive(onNext: { url in
                let url = URL(string: url!)
                UIApplication.shared.open(url!)
            }).disposed(by:disposeBag)

        output.isLoading
            .drive(onNext: { isloading in
                isloading ? self.indicator.startAnimating() : self.indicator.stopAnimating()
            }).disposed(by: disposeBag)
    }

    private func configureTableView() {
        tableView.register(UINib(nibName: "RepositoryViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "RepositoryViewCell")

        self.tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }

    private func configureNavigationView() {
        configureNavigationItem(title: "GitHubリポジトリ検索画面")
        showBackButton()
    }

    private func configureIndicatorView() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = .medium
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }

    private func stopIndicator() {
        self.indicator.stopAnimating()
    }
}

extension SearchRepositoryViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
}
