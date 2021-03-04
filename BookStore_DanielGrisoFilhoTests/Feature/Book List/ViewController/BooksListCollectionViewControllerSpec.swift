//
//  BooksListCollectionViewControllerSpec.swift
//  BookStore_DanielGrisoFilhoTests
//
//  Created by Daniel Griso Filho on 03/03/21.
//

import XCTest
@testable import BookStore_DanielGrisoFilho

class BooksListCollectionViewControllerSpec: XCTestCase {
    
    var mock: BooksListCollectionViewControllerMock?
    var viewController: BooksListCollectionViewController?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mock = BooksListCollectionViewControllerMock()
        viewController = BooksListCollectionViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mock?.updateScreenCalled = false
        mock?.showErrorCalled = false
        mock = nil
    }
    
    func testClassIdentifier() {
        XCTAssertNotNil(BooksListCollectionViewController.classIdentifier)
        XCTAssertEqual(BooksListCollectionViewController.classIdentifier, "BooksListCollectionViewController")
    }
    
    func testPageNumber() {
        XCTAssertNotNil(viewController?.requestPage)
    }
    
    func testUpdateScreen() {
        mock?.updateScreen()
        XCTAssertEqual(mock?.updateScreenCalled, true)
    }
    
    func testShowError() {
        mock?.showError(error: NSError())
        XCTAssertEqual(mock?.showErrorCalled, true)
    }

}

class BooksListCollectionViewControllerMock: BooksListViewModelViewDelegate {
    var updateScreenCalled = false
    var showErrorCalled = false
    
    func updateScreen() {
        updateScreenCalled = true
    }
    
    func showError(error: Error) {
        showErrorCalled = true
    }
    
}
