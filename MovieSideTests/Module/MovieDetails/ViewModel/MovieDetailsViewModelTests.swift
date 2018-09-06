//
//  MovieDetailViewModelTests.swift
//  MovieSideTests
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import XCTest
@testable import MovieSide

class MovieDetailsViewModelTests: XCTestCase {
    
    func test_viewModel_rendersTitle() {
        XCTAssertEqual(makeSUT().getTitle(), "Movie Detail")
    }
    
    func test_viewModel_rendersRows() {
        let sut = makeSUT()
        sut.rows = []
        XCTAssertEqual(sut.numberOfRows(), sut.rows.count)
        
        sut.rows = [.header(movie: Movie("Titanic"))]
        XCTAssertEqual(sut.numberOfRows(), sut.rows.count)
        
        let type = sut.rowType(for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(type)
    }
    
    func test_viewModel_getsMovieDetailsDataFromAPI() {
        let sut = makeSUT()
        var detailsCalled = false
        sut.getMovieDetails {
            detailsCalled = true
        }
        XCTAssertTrue(detailsCalled)
    }
    
    //MARK: - Helpers
    
    private func makeSUT() -> MovieDetailsViewModel {
        let apiClient = MockAPIClient(movies: [])
        let sut = MovieDetailsViewModel(apiClient: apiClient, movie: Movie(""))
        return sut
    }
}
