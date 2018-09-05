//
//  AppDelegate.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 4.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let apiClient = MovieAPIClient(apiEngine: APIEngine())
        let viewModel = NowPlayingViewModel(apiClient: apiClient)
        let viewController = NowPlayingViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }
}

