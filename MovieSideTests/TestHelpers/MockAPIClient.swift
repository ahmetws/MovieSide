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
    
    func getNowPlaying(completion: ([Movie]) -> Void) {
        completion(movies)
    }
    
    func getNowPlaying(completion: @escaping MovieAPIProtocol.NowPlayingMoviesCompletionHandler) {
        completion(movies, nil)
    }
    
    func getDetails(for movie: Movie, completion: @escaping MovieAPIProtocol.MovieDetailsCompletionHandler) {
        
    }
}
