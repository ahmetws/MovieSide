//
//  MockAPIClient.swift
//  MovieSideTests
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation
@testable import MovieSide

class MockAPIClient: MovieAPIProtocol {

    var apiEngine: APIEngineProtocol
    var movies = [Movie]()
    
    init(movies: [Movie], apiEngine: APIEngineProtocol = APIEngine()) {
        self.movies = movies
        self.apiEngine = apiEngine
    }
    
    func getNowPlaying(completion: @escaping MovieAPIProtocol.MoviesCompletionHandler) {
        completion(movies, nil)
    }
    
    func getMoviesInCollection(for movieDetails: MovieDetails, completion: @escaping MovieAPIProtocol.MoviesCompletionHandler) {
        
    }
    
    func getDetails(for movie: Movie, completion: @escaping MovieAPIProtocol.MovieDetailsCompletionHandler) {
        
    }
}
