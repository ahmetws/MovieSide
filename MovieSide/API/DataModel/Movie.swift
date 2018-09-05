//
//  Movie.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

protocol MovieProtocol: Codable {
    var movieId: Int { get set }
    var title: String { get set }
    var overview: String { get set }
    var posterPath: String { get set }
}

extension MovieProtocol {
    func getPosterUrl() -> String {
        return "\(AppConstants.API.BaseImagePath)\(posterPath)"
    }
}

struct Movie: MovieProtocol {
    var movieId: Int
    var title: String
    var overview: String
    var posterPath: String

    private enum CodingKeys : String, CodingKey {
        case movieId = "id", title, overview, posterPath = "poster_path"
    }
}
