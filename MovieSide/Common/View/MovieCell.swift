//
//  MovieCell.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 4.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 8.0
        clipsToBounds = true
    }
    
    func setup(with movie: Movie) {
        titleLabel.text = movie.title
        posterImageView.setImage(with: movie.posterUrl())
    }
}
