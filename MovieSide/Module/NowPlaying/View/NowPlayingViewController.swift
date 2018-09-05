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
        let movie = viewModel.movie(at: indexPath)
        cell.setup(with: movie)
        return cell
    }
}

extension NowPlayingViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.movie(at: indexPath)
        delegate.showDetails(of: movie, from: self)
    }
}

extension NowPlayingViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.size.width - CGFloat(AppConstants.MovieCollection.HorizontalSpaceBetweenItems * 3)) / 2
        return CGSize(width: width, height: width * CGFloat(AppConstants.MovieCollection.PosterImageRatio))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(AppConstants.MovieCollection.VerticleSpaceBetweenItems)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(AppConstants.MovieCollection.HorizontalSpaceBetweenItems) / 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftMargin = CGFloat(AppConstants.MovieCollection.HorizontalSpaceBetweenItems)
        let topMargin = CGFloat(AppConstants.MovieCollection.VerticleSpaceBetweenItems)
        return UIEdgeInsetsMake(topMargin, leftMargin, topMargin, leftMargin)
    }
}
