//
//  BooksListViewModel.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 02/03/21.
//
//  All rights reserved.
//

import UIKit

class BooksListViewModel {
    
    // MARK: - Delegates
    weak var coordinatorDelegate: BooksListViewModelCoordinatorDelegate?
    weak var viewDelegate: BooksListViewModelViewDelegate?
    
    // MARK: - Properties
    let service: BooksListService
    
    fileprivate var books: [Books] = [Books]()
    
    // MARK: - Init
    init(service: BooksListService = BooksListService()) {
        self.service = service
    }
    
    func start(page: Int) {
        getModel(page: page)
    }
    
    // MARK: - Network
    
    func getModel(page: Int) {
        service.fetchBooks(endPoint: "books", page: page) { (result) in
            switch result {
            case .success(let book):
                self.books.append(contentsOf: book)
                self.viewDelegate?.updateScreen()
            case .failure(let error):
                self.viewDelegate?.showError(error: error)
            }
        }
    }
}

extension BooksListViewModel: BooksListViewModelType {
    
    func numberOfItems() -> Int {
        return books.count
    }
    
    func itemFor(row: Int) -> Books {
        let item = books[row]
        return item
    }
    
    func didSelectRow(_ row: Int, from controller: UIViewController) {
        let bookSelected = books[row]
        coordinatorDelegate?.didSelect(model: bookSelected, from: controller)
    }
    
    func didSelectClose(from controller: UIViewController) {
        coordinatorDelegate?.didSelectClose(from: self, from: controller)
    }
}
