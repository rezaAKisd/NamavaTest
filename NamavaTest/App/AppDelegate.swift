//
//  AppDelegate.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        window?.rootViewController?.view.backgroundColor = .white
        
        
        window?.makeKeyAndVisible()
        return true
    }
}

