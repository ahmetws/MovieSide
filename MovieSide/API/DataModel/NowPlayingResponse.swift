//
//  NowPlayingResponse.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

struct NowPlayingResponse: Codable {
    var results: [Movie]
}

struct Movie: Codable {
    var title: String
    var overview: String
    var posterPath: String
    
    private enum CodingKeys : String, CodingKey {
        case title, overview, posterPath = "poster_path"
    }
    
    func posterUrl() -> String {
        return "\(AppConstants.API.BaseImagePath)\(posterPath)"
    }
}
