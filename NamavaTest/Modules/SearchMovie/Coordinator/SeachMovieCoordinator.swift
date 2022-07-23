//
//  SeachMovieCoordinator.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import UIKit
import Resolver

protocol SearchMovieFlow: AnyObject {
    func coordinateToMovieDetail(for movie: MovieEntity)
}

class SearchMovieCoordinator: Coordinator, SearchMovieFlow {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let searchMovieViewController: SearchMovieViewController = Resolver.resolve()
        searchMovieViewController.coordinator = self
        navigationController.pushViewController(searchMovieViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    func coordinateToMovieDetail(for movie: MovieEntity) {
        //To Do
    }
}
