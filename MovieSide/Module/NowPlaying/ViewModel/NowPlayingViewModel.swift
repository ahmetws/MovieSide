//
//  NowPlayingViewModel.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 4.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

class NowPlayingViewModel {
    
    var apiClient: MovieAPIProtocol!
    var movies: [Movie] = []
    
    init(apiClient: MovieAPIProtocol) {
        self.apiClient = apiClient
    }
    
    func getDataSource(didSelectItemHandler: @escaping MoviesDataSource.MovieSelectHandler) -> MoviesDataSource {
        return MoviesDataSource(with: movies, didSelectItemHandler: didSelectItemHandler)
    }
    
    func getMovies(completion: @escaping () -> Void) {
        apiClient.getNowPlaying { [weak self] (movieList, error) in
            if error == nil {
                self?.movies = movieList
            }
            completion()
        }
    }
    
    func getTitle() -> String {
        return "Now Playing"
    }
    
    func numberOfItems() -> Int {
        return movies.count
    }
    
    func movie(at indexPath: IndexPath) -> Movie {
        return movies[indexPath.row]
    }
}
