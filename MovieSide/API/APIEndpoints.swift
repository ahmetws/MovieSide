//
//  APIEndpoints.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

enum APIEndPoints: String {
    case nowPlaying = "movie/now_playing"
    
    func buildUrl() -> String {
        return "\(AppConstants.API.BaseURL)\(AppConstants.API.BaseAPIVersion)/\(self.rawValue)?api_key=\(AppConstants.API.TheMovieDBAPIKey)"
    }
}
