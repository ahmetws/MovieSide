//
//  MovieAPIProtocol.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

protocol MovieAPIProtocol {
    typealias MoviesCompletionHandler = ([String]) -> Void
    
    func getNowPlaying(completion: MoviesCompletionHandler)
}
