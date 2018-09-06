//
//  MovieAPIProtocol.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

protocol MovieAPIProtocol {
    typealias MoviesCompletionHandler = ([Movie], Error?) -> Void
    typealias MovieDetailsCompletionHandler = (MovieDetails?, Error?) -> Void

    var apiEngine: APIEngineProtocol { get set }

    func getNowPlaying(completion: @escaping MoviesCompletionHandler)
    func getDetails(for movie: Movie, completion: @escaping MovieDetailsCompletionHandler)
    func getMoviesInCollection(for movieDetails: MovieDetails, completion: @escaping MoviesCompletionHandler)
}
