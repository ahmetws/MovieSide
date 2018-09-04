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
        let sut = makeSUT()
        XCTAssertEqual(sut.getTitle(), "Now Playing")
    }
    
    func test_viewModel_rendersNumberOfItems() {
        XCTAssertEqual(makeSUT().numberOfItems(), 0)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(_ movies: [String] = []) -> NowPlayingViewModel {
        let sut = NowPlayingViewModel(movies: movies)
        return sut
    }
}
