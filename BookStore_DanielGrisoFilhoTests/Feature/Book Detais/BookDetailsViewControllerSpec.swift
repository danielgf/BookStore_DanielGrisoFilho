//
//  BookDetailsViewControllerSpec.swift
//  BookStore_DanielGrisoFilhoTests
//
//  Created by Daniel Griso Filho on 03/03/21.
//

import XCTest
@testable import BookStore_DanielGrisoFilho

class BookDetailsViewControllerSpec: XCTestCase {
    
    var bookdetail: BookDetailsViewController?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        bookdetail = BookDetailsViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        bookdetail = nil
    }
    
    func testClassIdentifier() {
        XCTAssertNotNil(BookDetailsViewController.classIdentifier)
        XCTAssertEqual(BookDetailsViewController.classIdentifier, "BookDetailsViewController")
    }
    
    func testFavoriteSingletonVariable() {
        XCTAssertNotNil(bookdetail?.favorite)
    }
}
