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
    var movies = [String]()
    
    init(movies: [String]) {
        self.movies = movies
    }
    
    func getNowPlaying(completion: ([String]) -> Void) {
        completion(movies)
    }
}
