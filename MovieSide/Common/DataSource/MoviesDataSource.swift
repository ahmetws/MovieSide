//
//  MoviesDataSource.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import UIKit

class MoviesDataSource: NSObject {
    typealias MovieSelectHandler = (Movie) -> ()
    
    var movies: [Movie] = []
    var didSelectItemHandler: MovieSelectHandler?
    
    init(with movies: [Movie], didSelectItemHandler: @escaping MovieSelectHandler) {
        self.movies = movies
        self.didSelectItemHandler = didSelectItemHandler
    }
}

extension MoviesDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.setup(with: movie)
        return cell
    }
}

extension MoviesDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        didSelectItemHandler?(movie)
    }
}

extension MoviesDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = AppConstants.MovieCollection.getItemWidth(from: Float(collectionView.frame.width))
        let height = width * AppConstants.MovieCollection.PosterImageRatio
        return CGSize(width: CGFloat(width), height: CGFloat(height))
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
