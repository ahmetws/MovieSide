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
        XCTAssertEqual(makeSUT(["Spider Man"]).numberOfItems(), 1)
        XCTAssertEqual(makeSUT(["Spider Man", "Hulk"]).numberOfItems(), 2)

    }
    
    func test_viewModel_getsDataFromAPI() {
        let sut = makeSUT()

        XCTAssertNotNil(sut.apiClient)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(_ movies: [String] = []) -> NowPlayingViewModel {
        let apiClient = MockAPIClient(movies: movies)
        let sut = NowPlayingViewModel(apiClient: apiClient)
        sut.getData()
        return sut
    }
}
