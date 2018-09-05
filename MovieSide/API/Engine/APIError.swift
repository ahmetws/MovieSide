//
//  APIError.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

enum APIError: String, Error {
    case invalidURL = "The URL is invalid"
    case invalidData = "The data is invalid"
    case invalidResponse = "The response is invalid"
}
