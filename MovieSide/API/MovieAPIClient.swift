//
//  MovieAPIClient.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

class MovieAPIClient: MovieAPIProtocol {
    
    var apiEngine: APIEngineProtocol
    
    init(apiEngine: APIEngineProtocol) {
        self.apiEngine = apiEngine
    }
    
    func getNowPlaying(completion: @escaping ([Movie], Error?) -> Void) {
        
        guard let url = URL(string: APIEndPoints.nowPlaying.buildUrl()) else {
            completion([], APIError.invalidURL)
            return
        }
        
        apiEngine.get(url: url) { (data, error) in
            if let error = error {
                completion([], error)
                return
            }
            
            guard let data = data else {
                completion([], APIError.invalidData)
                return
            }
            
            if let response = try? JSONDecoder().decode(NowPlayingResponse.self, from: data) {
                completion(response.results, nil)
                return
            } else {
                completion([], APIError.invalidResponse)
            }
        }
    }
}
