//
//  MovieAPIClient.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

class MovieAPIClient: MovieAPIProtocol {
    
    func getNowPlaying(completion: ([String]) -> Void) {
        completion([])
    }
    
}
