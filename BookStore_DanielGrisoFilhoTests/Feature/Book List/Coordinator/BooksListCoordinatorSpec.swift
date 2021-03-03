//
//  BooksListCoordinatorSpec.swift
//  BookStore_DanielGrisoFilhoTests
//
//  Created by Daniel Griso Filho on 03/03/21.
//

import XCTest
@testable import BookStore_DanielGrisoFilho

class BooksListCoordinatorSpec: XCTestCase {

    var coordinatorMock: BooksListCoordinatorMock?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        coordinatorMock = BooksListCoordinatorMock(navigationController: UINavigationController())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        coordinatorMock?.startCalled = false
        coordinatorMock = nil
    }
    
    func testStartFunction() {
        coordinatorMock?.start()
        let called = coordinatorMock?.startCalled ?? false
        XCTAssertTrue(called)
        XCTAssertEqual(called, true)
    }
}

class BooksListCoordinatorMock: Coordinator {
    var navigationController: UINavigationController?
    var startCalled = false
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        startCalled = true
    }
}
