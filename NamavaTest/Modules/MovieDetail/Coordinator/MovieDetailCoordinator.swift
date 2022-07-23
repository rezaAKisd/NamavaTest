//
//  MovieDetailCoordinator.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Foundation
import Resolver

protocol MovieDetailFlow: AnyObject {
    func coordinateToMoviePlayer(with movie: MovieEntity)
}

class MovieDetailCoordinator: Coordinator, MovieDetailFlow {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    var movie: MovieEntity!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let movieDetailViewController: MovieDetailViewController = Resolver.resolve()
        movieDetailViewController.coordinator = self
        movieDetailViewController.viewModel.model.movie.accept(movie)
        navigationController.pushViewController(movieDetailViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    func coordinateToMoviePlayer(with movie: MovieEntity) {
        //To Do
    }
}
