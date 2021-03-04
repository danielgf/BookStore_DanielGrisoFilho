//
//  BooksListViewModelSpec.swift
//  BookStore_DanielGrisoFilhoTests
//
//  Created by Daniel Griso Filho on 03/03/21.
//

import XCTest
@testable import BookStore_DanielGrisoFilho

class BooksListViewModelSpec: XCTestCase {
    
    var viewModel: BooksListViewModelMock?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = BooksListViewModelMock()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel?.numberOfItemsCalled = false
        viewModel?.itemForCalled = false
        viewModel?.startCalled = false
        viewModel?.didSelectRowCalled = false
        viewModel?.didSelectCloseCalled = false
        viewModel = nil
        
    }
    
    func testNumberOfItems() {
        _ = viewModel?.numberOfItems()
        let called = viewModel?.numberOfItemsCalled ?? false
        XCTAssertEqual(called, true)
    }
    
    func testItemFor() {
        _ = viewModel?.itemFor(row: 0)
        let called = viewModel?.itemForCalled ?? false
        XCTAssertEqual(called, true)
    }
    
    func teststart() {
        _ = viewModel?.start(page: 0)
        let called = viewModel?.startCalled ?? false
        XCTAssertEqual(called, true)
    }
    
    func testDidSelectRow() {
        _ = viewModel?.didSelectRow(0, from: UIViewController())
        let called = viewModel?.didSelectRowCalled ?? false
        XCTAssertEqual(called, true)
    }
    
    func testDidSelectClose() {
        _ = viewModel?.didSelectClose(from: UIViewController())
        let called = viewModel?.didSelectCloseCalled ?? false
        XCTAssertEqual(called, true)
    }
}

class BooksListViewModelMock: BooksListViewModelType {
    weak var viewDelegate: BooksListViewModelViewDelegate?
    weak var coordinatorDelegate: BooksListViewModelCoordinatorDelegate?
    var numberOfItemsCalled = false
    var itemForCalled = false
    var startCalled = false
    var didSelectRowCalled = false
    var didSelectCloseCalled = false
    
    func numberOfItems() -> Int {
        numberOfItemsCalled = true
        return 0
    }
    
    func itemFor(row: Int) -> Books {
        itemForCalled = true
        return Books()
    }
    
    func start(page: Int) {
        startCalled = true
    }
    
    func didSelectRow(_ row: Int, from controller: UIViewController) {
        didSelectRowCalled = true
    }
    
    func didSelectClose(from controller: UIViewController) {
        didSelectCloseCalled = true
    }
    
}
