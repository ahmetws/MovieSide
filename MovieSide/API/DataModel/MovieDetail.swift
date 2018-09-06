//
//  MovieDetails.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

struct MovieDetails: MovieProtocol {
    var movieId: Int
    var title: String
    var overview: String
    var posterPath: String
    var belongsToCollection: BelongsToCollection

    private enum CodingKeys : String, CodingKey {
        case movieId = "id", title, overview, posterPath = "poster_path", belongsToCollection = "belongs_to_collection"
    }
}

struct BelongsToCollection: Codable {
    var collectionId: Int
    var name: String
    
    private enum CodingKeys: String, CodingKey { case collectionId = "id", name }

}
