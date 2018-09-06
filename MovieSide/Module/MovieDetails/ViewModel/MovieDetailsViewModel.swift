//
//  MovieDetailsViewModel.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

enum MovieDetailsRowType {
    case header(movie: Movie)
    case collection(movies: [Movie], collectionName: String)
}

protocol MovieDetailsViewModelProtocol {
    var rows: [MovieDetailsRowType] { get set }

    func getTitle() -> String
    func numberOfRows() -> Int
    func rowType(for indexPath: IndexPath) -> MovieDetailsRowType
    func movieBelongsToCollection() -> Bool
    func updateCollection()
    
    func getMovieDetails(completion: @escaping () -> Void)
    func getCollectionDetails(completion: @escaping () -> Void)
}

class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    
    var rows: [MovieDetailsRowType]

    private var apiClient: MovieAPIProtocol!
    private var currentMovie: Movie!
    private var movieDetails: MovieDetails?
    private var moviesInCollection: [Movie] = []
    
    init(apiClient: MovieAPIProtocol, movie: Movie) {
        self.apiClient = apiClient
        self.currentMovie = movie
        rows = [.header(movie: movie)]
    }
    
    func getTitle() -> String {
        return "Movie Detail"
    }
    
    func numberOfRows() -> Int {
        return rows.count
    }
    
    func rowType(for indexPath: IndexPath) -> MovieDetailsRowType {
        return rows[indexPath.row]
    }
    
    func movieBelongsToCollection() -> Bool {
        if movieDetails?.belongsToCollection.collectionId != nil {
            return true
        }
        return false
    }
    
    func updateCollection() {
        guard movieBelongsToCollection() && !moviesInCollection.isEmpty else { return }
       
        let collectionName = movieDetails?.belongsToCollection.name ?? ""
        rows = [
            .header(movie: currentMovie),
            .collection(movies: moviesInCollection, collectionName: collectionName)
        ]
    }
    
    func getMovieDetails(completion: @escaping () -> Void) {
        apiClient.getDetails(for: currentMovie) { [weak self] (movieDetails, error) in
            if movieDetails != nil {
                self?.movieDetails = movieDetails
            }
            completion()
        }
    }
    
    func getCollectionDetails(completion: @escaping () -> Void) {
        guard let movieDetails = movieDetails else { return }
        
        apiClient.getMoviesInCollection(for: movieDetails) { [weak self] (moviesInCollection, error) in
            if !moviesInCollection.isEmpty{
                self?.moviesInCollection = moviesInCollection
            }
            completion()
        }
    }
    
}
