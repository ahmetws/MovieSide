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
        XCTAssertEqual(makeSUT([Movie("Spider Man")]).collectionView.numberOfItems(), 1)
        XCTAssertEqual(makeSUT([Movie("Spider Man"), Movie("Hulk")]).collectionView.numberOfItems(), 2)
        XCTAssertEqual(makeSUT([Movie("Spider Man"), Movie("Hulk"), Movie("Now You See Me")]).collectionView.numberOfItems(), 3)
    }
    
    func test_collectionView_rendersCellForMovies() {
        let movies = [Movie("Spider Man"), Movie("Hulk"), Movie("Now You See Me")]
        XCTAssertEqual(makeSUT(movies).collectionView.title(at: 0), movies[0].title)
        XCTAssertEqual(makeSUT(movies).collectionView.title(at: 1), movies[1].title)
        XCTAssertEqual(makeSUT(movies).collectionView.title(at: 2), movies[2].title)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(_ movies: [Movie] = []) -> NowPlayingViewController {
        let apiClient = MockAPIClient(movies: movies)
        let viewModel = NowPlayingViewModel(apiClient: apiClient)
        viewModel.movies = movies
        
        let sut = NowPlayingViewController(viewModel: viewModel)
        _ = sut.view
        return sut
    }
}

private extension UICollectionView {
    func numberOfItems() -> Int {
        return numberOfItems(inSection: 0)
    }
    
    func cell(at row: Int) -> UICollectionViewCell? {
        return dataSource?.collectionView(self, cellForItemAt: IndexPath(item: row, section: 0))
    }
    
    func title(at row: Int) -> String? {
        let movieCell = cell(at: row) as! MovieCell
        return movieCell.titleLabel.text
    }
}
