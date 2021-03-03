//
//  BooksListServiceSpec.swift
//  BookStore_DanielGrisoFilhoTests
//
//  Created by Daniel Griso Filho on 03/03/21.
//

import XCTest
@testable import BookStore_DanielGrisoFilho

class BooksListServiceSpec: XCTestCase {
    
    var serviceMock: BooksListServiceMock?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        serviceMock = BooksListServiceMock()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        serviceMock = nil
    }
    
    func testFetchBooks() {
        serviceMock?.fetchBooks(endPoint: "", page: 0, completionHandler: { (result) in
            switch result {
            case .success(let books):
                XCTAssertNotNil(books)
            case .failure(let error):
                XCTAssertNil(error)
            }
        })
    }

}

class BooksListServiceMock: BooksListAPIService {
    func fetchBooks(endPoint: String, page: Int, completionHandler: @escaping (Result<BooksList, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "BooksListMock", withExtension: ".json") else {
            completionHandler(.failure(NSError(domain: "failed parse url",
                                               code: 0, userInfo: nil)))
            return
        }
        do {
            
            let jsonData = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(BooksList.self, from: jsonData)
            completionHandler(.success(result))
        } catch {
            completionHandler(.failure(error))
        }
        
    }
}
