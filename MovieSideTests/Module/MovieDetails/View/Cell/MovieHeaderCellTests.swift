//
//  MovieHeaderCellTests.swift
//  MovieSideTests
//
//  Created by Ahmet Yalcinkaya on 6.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import XCTest
@testable import MovieSide

class MovieHeaderCellTests: XCTestCase {
    
    func test_setup_rendersCorrectData() {
        let sut = makeSUT()
        
        sut.setup(with: Movie("Spider Man"))
        
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertEqual(sut.titleLabel.text, "Spider Man")
    }
    
    //MARK: - Helpers
    
    private func makeSUT() -> MovieHeaderCell {
        let nib = UINib(nibName: MovieHeaderCell.identifier, bundle: nil)
        let cell = nib.instantiate(withOwner: nil, options: [:]).first as! MovieHeaderCell
        return cell
    }
    
}
