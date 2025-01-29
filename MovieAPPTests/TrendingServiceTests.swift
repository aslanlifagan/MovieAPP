//
//  TrendingServiceTests.swift
//  MovieAPP
//
//  Created by Aslanli Faqan on 29.01.25.
//

import XCTest
@testable import MovieAPP

final class TrendingServiceTests: XCTestCase {
    private var manager: MockManager!
    private var service: TrendingUseCase!
    
    override func setUp() {
        super.setUp()
        manager = MockManager()
        service = TrendingSpyAPIService(mockManager: manager)
    }
    
    override func tearDown() {
        super.tearDown()
        manager = nil
        service = nil
        
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let result = service.getTrendingMovie(timeInterval: "day") { response, error in
            XCTAssertNotNil(response, "\(response)")
            XCTAssertNil(error, "\(error)")
            XCTAssertNotEqual(response?.results?.first?.voteCount, 1000)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
