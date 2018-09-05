//
//  APIEngineTests.swift
//  MovieSideTests
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import XCTest
@testable import MovieSide

class APIEngineTests: XCTestCase {
    
    func test_apiEngine_get_callsCompletion() {
        let sut = makeSUT(session: makeSession())
        
        var completionCalled = false
        sut.get(url: URL(string: "http://")!) { (data, error) in
            completionCalled = true
        }
        
        XCTAssertTrue(completionCalled)
    }
    
    func test_apiEngine_get_callsCorrectUrl() {
        let session = makeSession()
        let sut = makeSUT(session: session)

        let url = URL(string: "http://")!
        sut.get(url: url) { (_,_) in }
        
        XCTAssertEqual(session.currentURL, url)
    }
    
    func test_apiEngine_get_callsDataTaskResume() {
        let dataTask = MockURLDataTask()
        let session = makeSession(dataTask: dataTask)
        let sut = makeSUT(session: session)
        
        let url = URL(string: "http://")!
        sut.get(url: url) { (_,_) in }
        
        XCTAssertTrue(dataTask.resumeCalled)
    }
    
    // MARK: - Helpers
    
    func makeSUT(session: MockURLSession) -> APIEngine {
        return APIEngine(urlSession: session)
    }
    
    func makeSession(dataTask: MockURLDataTask = MockURLDataTask()) -> MockURLSession {
        return MockURLSession(dataTask: dataTask)
    }
    
}

class MockURLDataTask: URLSessionDataTaskProtocol {
    
    var resumeCalled: Bool = false

    func resume() {
        resumeCalled = true
    }
}

class MockURLSession: URLSessionProtocol {
    var dataTask: URLSessionDataTaskProtocol
    var currentURL: URL?
    
    init(dataTask: URLSessionDataTaskProtocol) {
        self.dataTask = dataTask
    }
    
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTaskProtocol {
        currentURL = request.url
        completionHandler(nil, nil, nil)
        return dataTask
    }
}
