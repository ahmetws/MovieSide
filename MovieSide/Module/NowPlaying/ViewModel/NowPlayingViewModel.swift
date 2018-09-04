//
//  NowPlayingViewModel.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 4.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

class NowPlayingViewModel {
    
    var movies: [String] = []
    
    init(movies: [String]) {
        self.movies = movies
    }
    
    func getTitle() -> String {
        return "Now Playing"
    }
    
    func numberOfItems() -> Int {
        return movies.count
    }
}
