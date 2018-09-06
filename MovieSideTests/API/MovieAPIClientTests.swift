//
//  MovieAPIClientTests.swift
//  MovieSideTests
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import XCTest
@testable import MovieSide

class MovieAPIClientTests: XCTestCase {
    
    func test_nowPlaying_completionCall() {
        var completionCalled = true
        let sut = makeSUT()

        sut.getNowPlaying { (_,_) in
            completionCalled = true
        }
        
        XCTAssertTrue(completionCalled)
    }
    
    func test_getDetails_completionCall() {
        var completionCalled = true
        let sut = makeSUT()

        sut.getDetails(for: Movie("")) { (_, _) in
            completionCalled = true
        }
        
        XCTAssertTrue(completionCalled)
    }
    
    func test_getMoviesInCollection_completionCall() {
        var completionCalled = true
        let sut = makeSUT()
        
        sut.getMoviesInCollection(for: MovieDetails("")) { (_, _) in
            completionCalled = true
        }
        
        XCTAssertTrue(completionCalled)
    }
    
    //MARK: - Helpers
    
    func makeSUT() -> MockAPIClient {
        return MockAPIClient(movies: [], apiEngine: APIEngine())
    }
    
}
