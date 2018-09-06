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
    
    func getNowPlaying(completion: @escaping MovieAPIProtocol.MoviesCompletionHandler) {
        
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
    
    func getDetails(for movie: Movie, completion: @escaping MovieAPIProtocol.MovieDetailsCompletionHandler) {
        guard let url = URL(string: APIEndPoints.movieDetails(movie: movie).buildUrl()) else {
            completion(nil, APIError.invalidURL)
            return
        }
        
        apiEngine.get(url: url) { (data, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, APIError.invalidData)
                return
            }
            
            if let response = try? JSONDecoder().decode(MovieDetails.self, from: data) {
                completion(response, nil)
                return
            } else {
                completion(nil, APIError.invalidResponse)
            }
        }
    }
    
    func getMoviesInCollection(for movieDetails: MovieDetails, completion: @escaping MovieAPIProtocol.MoviesCompletionHandler) {
        
        guard let url = URL(string: APIEndPoints.moviesInCollection(movieDetails: movieDetails).buildUrl()) else {
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
            
            if let response = try? JSONDecoder().decode(CollectionResponse.self, from: data) {
                completion(response.parts, nil)
                return
            } else {
                completion([], APIError.invalidResponse)
            }
        }
    }
}
