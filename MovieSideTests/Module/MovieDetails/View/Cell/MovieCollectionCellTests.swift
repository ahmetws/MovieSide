//
//  MovieCollectionCellTests.swift
//  MovieSideTests
//
//  Created by Ahmet Yalcinkaya on 6.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import XCTest
@testable import MovieSide

class MovieCollectionCellTests: XCTestCase {
    
    func test_setup_rendersCorrectData() {
        let sut = makeSUT()
        
        sut.setup(collectionName: "Spider", movies:  [Movie("Spider Man")]) { (_) in }
        
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertEqual(sut.titleLabel.text, "In Collection: Spider")
    }
    
    //MARK: - Helpers
    
    private func makeSUT() -> MovieCollectionCell {
        let nib = UINib(nibName: MovieCollectionCell.identifier, bundle: nil)
        let cell = nib.instantiate(withOwner: nil, options: [:]).first as! MovieCollectionCell
        return cell
    }
    
}
