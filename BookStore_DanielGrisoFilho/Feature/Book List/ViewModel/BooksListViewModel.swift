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
    
    fileprivate var books: [BooksList] = []
    
    fileprivate var isLoading = false
    
    // MARK: - Init
    init(service: BooksListService = BooksListService()) {
        self.service = service
    }
    
    func start() {
        getModel()
    }
    
    // MARK: - Network
    
    func getModel() {
        
        viewDelegate?.updateScreen()
    }
    
}

extension BooksListViewModel: BooksListViewModelType {
    
    func numberOfItems() -> Int {
        return isLoading ? books.count : 0
    }
    
    func itemFor(row: Int) -> BooksList {
        let item = isLoading ? books[row] : BooksList()
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
