//
//  MovieDetailViewControllerTests.swift
//  MovieSideTests
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import XCTest
@testable import MovieSide

class MovieDetailsViewControllerTests: XCTestCase {
    
    func test_viewDidLoad_rendersHeaderTitle() {
        XCTAssertEqual(makeSUT().navigationItem.title, "Movie Detail")
    }
    
    //MARK: - Helpers
    
    private func makeSUT() -> MovieDetailsViewController {
        let apiClient = MockAPIClient(movies: [])
        let viewModel = MovieDetailsViewModel(apiClient: apiClient, movie: Movie(""))
        
        let sut = MovieDetailsViewController(viewModel: viewModel)
        _ = sut.view
        return sut
    }
}
