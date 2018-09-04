//
//  NowPlayingViewControllerTests.swift
//  MovieSideTests
//
//  Created by Ahmet Yalcinkaya on 4.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import XCTest
@testable import MovieSide

class NowPlayingViewControllerTests: XCTestCase {
    
    func test_viewDidLoad_rendersHeaderTitle() {
        XCTAssertEqual(makeSUT().navigationItem.title, "Now Playing")
    }
    
    func test_viewDidLoad_configuresCollectionView() {
        XCTAssertNotNil(makeSUT().collectionView)
    }
    
    func test_collectionView_rendersWithoutMovies() {
        XCTAssertEqual(makeSUT().collectionView.numberOfItems(inSection: 0), 0)
    }
    
    func test_collectionView_rendersMovies() {
        XCTAssertEqual(makeSUT(["Spider Man"]).collectionView.numberOfItems(), 1)
        XCTAssertEqual(makeSUT(["Spider Man", "Hulk"]).collectionView.numberOfItems(), 2)
        XCTAssertEqual(makeSUT(["Spider Man", "Hulk", "Now You See Me"]).collectionView.numberOfItems(), 3)
    }
    
    func test_collectionView_rendersCellForMovies() {
        let sut = makeSUT(["Spider Man"])
        let cell = sut.collectionView(sut.collectionView, cellForItemAt: IndexPath(item: 0, section: 0))
        XCTAssertNotNil(cell)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(_ movies: [String] = []) -> NowPlayingViewController {
        let viewModel = NowPlayingViewModel(movies: movies)
        let sut = NowPlayingViewController(viewModel: viewModel)
        _ = sut.view
        return sut
    }
}

private extension UICollectionView {
    func numberOfItems() -> Int {
        return numberOfItems(inSection: 0)
    }
}
