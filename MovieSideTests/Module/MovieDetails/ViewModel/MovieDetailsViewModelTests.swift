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
    
    //MARK: - Helpers
    
    private func makeSUT() -> MovieDetailsViewModel {
        let apiClient = MockAPIClient(movies: [])
        let sut = MovieDetailsViewModel(apiClient: apiClient, movie: Movie(""))
        return sut
    }
}
