//
//  NowPlayingViewController.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 4.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import UIKit

protocol NowPlayingViewControllerDelegate: class {
    func showDetails(of movie: Movie, from viewController: UIViewController)
}

class NowPlayingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: NowPlayingViewControllerDelegate!
    
    private var dataSource: MoviesDataSource?
    
    var viewModel: NowPlayingViewModel!
    
    convenience init(viewModel: NowPlayingViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        getMovies()
    }
    
    //MARK: UI

    private func prepareUI() {
        title = viewModel.getTitle()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)

        collectionView.register(MovieCell.self)
    }
    
    private func reloadData() {
        dataSource = viewModel.getDataSource { [weak self] (movie) in
            self?.didSelect(movie: movie)
        }
        
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        collectionView.reloadData()
    }
    
    private func didSelect(movie: Movie) {
        delegate.showDetails(of: movie, from: self)
    }
    
    //MARK: Data

    private func getMovies() {
        viewModel.getMovies { [weak self] in
            DispatchQueue.main.async {
                self?.reloadData()
            }
        }
    }
}
