//
//  APIEndpoints.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

enum APIEndPoints {
    case nowPlaying
    case movieDetails(movie: Movie)
    case moviesInCollection(movieDetails: MovieDetails)

    func endPoint() -> String {
        switch self {
        case .nowPlaying:
            return "movie/now_playing"
        case .movieDetails(let movie):
            return "movie/\(movie.movieId)"
        case .moviesInCollection(let movieDetails):
            return "collection/\(movieDetails.belongsToCollection.collectionId)"
        }
    }
    
    func buildUrl() -> String {
        return "\(AppConstants.API.BaseURL)\(AppConstants.API.BaseAPIVersion)/\(endPoint())?api_key=\(AppConstants.API.TheMovieDBAPIKey)"
    }
}
