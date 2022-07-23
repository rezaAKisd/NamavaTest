//
//  SearchMovieViewController.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import UIKit
import RxSwift
import RxCocoa
import Resolver
import RxDataSources

class SearchMovieViewController: UIViewController {

    //MARK: -Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: -Properties
    
    private let disposeBag = DisposeBag()
    private var dataSource: RxTableViewSectionedReloadDataSource<MovieSectionModelType>?
    
    @Injected var viewModel: SearchMovieViewModel
    weak var coordinator: SearchMovieFlow?
    
    //MARK: -LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureSearchBar()
        bindFrom()
    }
}


// MARK: - Configure Views

extension SearchMovieViewController {
    
    func bindFrom() {
        viewModel
            .section
            .asObservable()
            .unwrap()
            .map({ [$0] })
            .bind(to: tableView.rx.items(dataSource: dataSource!))
            .disposed(by: disposeBag)
    }
    
    private var configureCell: RxTableViewSectionedReloadDataSource<MovieSectionModelType>.ConfigureCell {
        return { dataSource, tableView, indexPath, _ in
            
            switch dataSource[indexPath] {
            case let .movieItem(model):
                let cell: MovieCardTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
                cell.configuration(with: model)
                return cell
                
            case .loading:
                let cell: ShareTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
                cell.cellType.accept(.loading)
                return cell
                
            case .placeHolder:
                let cell: ShareTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
                cell.cellType.accept(.placeholder)
                return cell
            }
        }
    }
}


// MARK: - Table View Delegate
extension SearchMovieViewController: UITableViewDelegate {
    
    private func setupTableView() {
        setTableDelegate()
        registerTableCell()
        setTableViewDataSource()
    }
    
    private func setTableDelegate() {
        tableView
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    private func registerTableCell() {
        tableView.register(cellType: MovieCardTableViewCell.self)
        tableView.register(cellType: ShareTableViewCell.self)
    }
    
    private func setTableViewDataSource() {
        dataSource = RxTableViewSectionedReloadDataSource<MovieSectionModelType>(configureCell: configureCell
        )
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch dataSource?[indexPath]{
            case .movieItem(_):
                return 120
        case .loading, .placeHolder:
                return tableView.frame.height
            case .none:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch dataSource?[indexPath]{
            case .movieItem(let movie):
            coordinator?.coordinateToMovieDetail(for: movie)
            default:
                return
        }
    }
}


// MARK: - Search Controller Delegates
extension SearchMovieViewController {
    
    private func configureSearchBar() {
        subscribeSearchBarEvents()
    }
    
    private func subscribeSearchBarEvents() {
        searchBar
            .rx
            .text
            .distinctUntilChanged()
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .asObservable()
            .bind(to: viewModel.searchText)
            .disposed(by: disposeBag)
    }
}
