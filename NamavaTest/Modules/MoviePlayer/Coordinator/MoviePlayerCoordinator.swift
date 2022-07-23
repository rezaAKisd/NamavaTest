//
//  MoviePlayerCoordinator.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Foundation
import Resolver

protocol MoviePlayerFlow: Coordinator {
    
}

class MoviePlayerCoordinator: MoviePlayerFlow {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    var movie: MovieEntity!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let moviePlayerlViewController: MoviePlayerViewController = Resolver.resolve()
        moviePlayerlViewController.coordinator = self
        navigationController.present(moviePlayerlViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    
}
