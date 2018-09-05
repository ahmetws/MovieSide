//
//  MovieDetailsViewModel.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

class MovieDetailsViewModel {
    
    enum MovieDetailsRowType {
        case header(movie: Movie)
        case collection
    }
    
    private var apiClient: MovieAPIProtocol!
    private var currentMovie: Movie!
    private var movieDetails: MovieDetail!

    var rows: [MovieDetailsRowType]
    
    init(apiClient: MovieAPIProtocol, movie: Movie) {
        self.apiClient = apiClient
        self.currentMovie = movie
        rows = [.header(movie: movie)]
    }
    
    func getTitle() -> String {
        return "Movie Detail"
    }
    
    func numberOfRows() -> Int {
        return rows.count
    }
    
    func rowType(for indexPath: IndexPath) -> MovieDetailsRowType {
        return rows[indexPath.row]
    }
    
    func getMovieDetails(completion: @escaping () -> Void) {
        apiClient.getDetails(for: currentMovie) { [weak self] (movieDetails, error) in
            if movieDetails != nil {
                self?.movieDetails = movieDetails
            }
            completion()
        }
    }
    
}
