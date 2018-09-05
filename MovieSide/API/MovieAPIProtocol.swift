//
//  MovieAPIProtocol.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

protocol MovieAPIProtocol {
    typealias NowPlayingMoviesCompletionHandler = ([Movie], Error?) -> Void
    typealias MovieDetailsCompletionHandler = (MovieDetail?, Error?) -> Void

    var apiEngine: APIEngineProtocol { get set }

    func getNowPlaying(completion: @escaping NowPlayingMoviesCompletionHandler)
    func getDetails(for movie: Movie, completion: @escaping MovieDetailsCompletionHandler)
}
