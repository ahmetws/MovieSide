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
    
    func test_completionCall() {
        var completionCalled = true
        let sut = MovieAPIClient(apiEngine: APIEngine())
        
        sut.getNowPlaying { (_,_) in
            completionCalled = true
        }
        
        XCTAssertTrue(completionCalled)
    }
    
}
