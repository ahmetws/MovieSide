//
//  MovieExtensions.swift
//  MovieSideTests
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation
@testable import MovieSide

extension Movie: Equatable {
    public static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title
    }
    
    init(_ title: String) {
        self.init(movieId: 1, title: title, overview: "", posterPath: "")
    }
}

extension MovieDetails {
    init(_ title: String) {
        self.init(movieId: 0, title: title, overview: "", posterPath: "", belongsToCollection: BelongsToCollection(collectionId: 0, name: ""))
    }
}
