//
//  AppCoordinator.swift
//  MovieSideTests
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import XCTest
@testable import MovieSide

class AppCoordinatorTests: XCTestCase {
    
    func test_coordinator_makesRootViewController() {
        let sut = AppCoordinator(window: UIWindow(frame: UIScreen.main.bounds))
        
        sut.start()
        
        XCTAssertNotNil(sut.rootViewController)
    }
}
