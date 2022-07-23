//
//  AppCoordinator.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.navigationBar.isHidden = true
        
        //To Do
    }
}

