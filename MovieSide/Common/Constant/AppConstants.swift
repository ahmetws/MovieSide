//
//  AppConstants.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

struct AppConstants {
    
    struct API {
        static let TheMovieDBAPIKey = "aed1fed441bebe01ec5307c0c00c61f0"
        static let BaseURL = "https://api.themoviedb.org/"
        static let BaseAPIVersion = "3"
        static let BaseImagePath = "https://image.tmdb.org/t/p/w500"
    }
    
    struct MovieCollection {
        static let PosterImageRatio: Float = 3.0/2.0
        static let NumberOfColumnsInGrid: Float = 2
        static let HorizontalSpaceBetweenItems: Float = 8
        static let VerticleSpaceBetweenItems: Float = 8
        static let CollectionSectionTitleHeight: Float = 40

        static func getItemWidth(from totalWidth: Float) -> Float {
            return (totalWidth - AppConstants.MovieCollection.HorizontalSpaceBetweenItems * (NumberOfColumnsInGrid + 1)) / NumberOfColumnsInGrid
        }
        
        static func getItemHeight(from totalWidth: Float) -> Float {
            let itemWidth = getItemWidth(from: totalWidth)
            return itemWidth * PosterImageRatio
        }
        
        static func collectionHeight(from totalWidth: Float, itemCount: Int) -> Float {
            let itemHeight = AppConstants.MovieCollection.getItemHeight(from: totalWidth) + VerticleSpaceBetweenItems
            let rowCount = Float(itemCount) / AppConstants.MovieCollection.NumberOfColumnsInGrid
            return itemHeight * rowCount
        }
    }
    
}
