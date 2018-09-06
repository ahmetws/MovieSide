//
//  MovieCollectionCell.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import UIKit

class MovieCollectionCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!

    var dataSource: MoviesDataSource!
    
    func setup(collectionName: String, movies: [Movie], didSelectHandler: @escaping MoviesDataSource.MovieSelectHandler) {
        
        titleLabel.text = "In Collection: \(collectionName)"
        
        dataSource = MoviesDataSource(with: movies, didSelectItemHandler: didSelectHandler)
        
        collectionView.register(MovieCell.self)
        
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        collectionView.reloadData()
    }

}
