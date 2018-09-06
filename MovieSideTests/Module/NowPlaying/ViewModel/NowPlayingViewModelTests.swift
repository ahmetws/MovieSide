//
//  NowPlayingViewModelTests.swift
//  MovieSideTests
//
//  Created by Ahmet Yalcinkaya on 4.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import XCTest
@testable import MovieSide

class NowPlayingViewModelTests: XCTestCase {
    
    func test_viewModel_rendersTitle() {
        XCTAssertEqual(makeSUT().getTitle(), "Now Playing")
    }
    
    func test_viewModel_rendersNumberOfItems() {
        XCTAssertEqual(makeSUT().numberOfItems(), 0)
        XCTAssertEqual(makeSUT([Movie("Spider Man")]).numberOfItems(), 1)
        XCTAssertEqual(makeSUT([Movie("Spider Man"), Movie("Hulk")]).numberOfItems(), 2)

    }
    
    func test_viewModel_getsDataFromAPI() {
        let sut = makeSUT()
        XCTAssertNotNil(sut.apiClient)
        
        var completionCalled = false
        sut.getMovies {
            completionCalled = true
        }
        
        XCTAssertTrue(completionCalled)
    }
    
    func test_viewModel_getsCorrectMovies() {
        let sut = makeSUT([Movie("Spider Man"), Movie("Hulk")])
        XCTAssertEqual(sut.movie(at: IndexPath(row: 0, section: 0)), sut.movies[0])
        XCTAssertEqual(sut.movie(at: IndexPath(row: 1, section: 0)), sut.movies[1])
    }
    
    //MARK: - Helpers
    
    private func makeSUT(_ movies: [Movie] = []) -> NowPlayingViewModel {
        let apiClient = MockAPIClient(movies: movies)
        let sut = NowPlayingViewModel(apiClient: apiClient)
        sut.movies = movies
        return sut
    }
}
