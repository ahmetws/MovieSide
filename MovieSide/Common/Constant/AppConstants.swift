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
        static let HorizontalSpaceBetweenItems: Float = 8
        static let VerticleSpaceBetweenItems: Float = 8
    }
    
}
