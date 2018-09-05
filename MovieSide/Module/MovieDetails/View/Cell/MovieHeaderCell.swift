//
//  MovieHeaderCell.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import UIKit

class MovieHeaderCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!

    func setup(with movie: Movie) {
        titleLabel.text = movie.title
        overViewLabel.text = movie.overview
        posterImageView.setImage(with: movie.getPosterUrl())
    }
    
}
