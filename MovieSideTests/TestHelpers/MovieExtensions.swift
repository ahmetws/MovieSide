//
//  MovieExtensions.swift
//  MovieSideTests
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation
@testable import MovieSide

extension Movie {
    init(_ title: String) {
        self.init(title: title, overview: "", posterPath: "")
    }
}
