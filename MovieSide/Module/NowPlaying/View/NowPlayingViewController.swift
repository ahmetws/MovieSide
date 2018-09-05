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
        
        collectionView.register(MovieCell.self)
    }
    
    private func reloadData() {
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
    
    
}

extension NowPlayingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        cell.titleLabel.text = viewModel.titleForCell(at: indexPath)
        return cell
    }
    
}
