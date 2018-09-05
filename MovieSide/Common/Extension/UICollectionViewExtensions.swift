//
//  UICollectionViewExtensions.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register(_ cell: UICollectionViewCell.Type) {
        register(UINib(nibName: cell.identifier, bundle: nil), forCellWithReuseIdentifier: cell.identifier)
    }
}
