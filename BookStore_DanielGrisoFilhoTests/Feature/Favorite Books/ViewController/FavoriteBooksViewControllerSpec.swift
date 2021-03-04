//
//  FavoriteBooksViewControllerSpec.swift
//  BookStore_DanielGrisoFilhoTests
//
//  Created by Daniel Griso Filho on 04/03/21.
//

import XCTest
@testable import BookStore_DanielGrisoFilho

class FavoriteBooksViewControllerSpec: XCTestCase {
    
    var mock: FavoriteBooksViewControllerMock?
    var viewController: FavoriteBooksViewController?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mock = FavoriteBooksViewControllerMock()
        viewController = FavoriteBooksViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mock?.updateScreenCalled = false
        mock = nil
    }
    
    func testClassIdentifier() {
        XCTAssertNotNil(FavoriteBooksViewController.classIdentifier)
        XCTAssertEqual(FavoriteBooksViewController.classIdentifier, "FavoriteBooksViewController")
    }
    
    func testUpdateScreen() {
        mock?.updateScreen()
        XCTAssertEqual(mock?.updateScreenCalled, true)
    }

}

class FavoriteBooksViewControllerMock: FavoriteBooksViewModelViewDelegate {
    var updateScreenCalled = false
    
    func updateScreen() {
        updateScreenCalled = true
    }
    
}
