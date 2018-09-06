//
//  AppCoordinator.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import UIKit

protocol ShowDetailsCoordinatorDelegate: class {
    func showDetails(of movie: Movie, from viewController: UIViewController)
}

class AppCoordinator: AppCoordinatorProtocol {
    
    var rootViewController: UINavigationController!
    var apiEngine: APIEngine!
    let apiClient: MovieAPIClient!
    let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
        apiEngine = APIEngine()
        apiClient = MovieAPIClient(apiEngine: apiEngine)
    }
    
    func start() {
        guard let window = window else { return }
        
        rootViewController = UINavigationController(rootViewController: getNowPlayingController())
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    func getNowPlayingController() -> NowPlayingViewController {
        let viewModel = NowPlayingViewModel(apiClient: apiClient)
        let viewController = NowPlayingViewController(viewModel: viewModel)
        viewController.delegate = self
        return viewController
    }
}

extension AppCoordinator: ShowDetailsCoordinatorDelegate {
    
    func showDetails(of movie: Movie, from viewController: UIViewController) {
        let viewModel = MovieDetailsViewModel(apiClient: apiClient, movie: movie)
        let movieDetailController = MovieDetailsViewController(viewModel: viewModel)
        movieDetailController.delegate = self
        viewController.show(movieDetailController, sender: nil)
    }
}
