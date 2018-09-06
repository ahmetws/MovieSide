//
//  NowPlayingViewController.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 4.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: ShowDetailsCoordinatorDelegate!
    
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
    
    func reloadData() {
        dataSource = viewModel.getDataSource(didSelectItemHandler: didSelectMovie())
        
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        collectionView.reloadData()
    }
    
    //MARK: Data

    private func getMovies() {
        viewModel.getMovies { [weak self] in
            DispatchQueue.main.async {
                self?.reloadData()
            }
        }
    }
    
    //MARK: Selection

    private func didSelectMovie() -> MoviesDataSource.MovieSelectHandler {
        return { [weak self] (movie) in
            if let strongSelf = self {
                strongSelf.delegate.showDetails(of: movie, from: strongSelf)
            }
        }
    }
}
