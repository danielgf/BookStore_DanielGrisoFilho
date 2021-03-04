//
//  FavoriteBooksViewModel.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 03/03/21.
//
//  All rights reserved.
//

import UIKit

class FavoriteBooksViewModel {
    
    // MARK: - Delegates
    weak var coordinatorDelegate: FavoriteBooksViewModelCoordinatorDelegate?
    weak var viewDelegate: FavoriteBooksViewModelViewDelegate?
    
    // MARK: - Properties
    
    let favorite = FavoriteBooks.shared
    fileprivate var favoriteBooks = [Books]()
    
    // MARK: - Init
    
    func start() {
        getModel()
    }
    
    // MARK: - Network
    
    func getModel() {
        favoriteBooks = favorite.favoriteBooks
        viewDelegate?.updateScreen()
    }
    
}

extension FavoriteBooksViewModel: FavoriteBooksViewModelType {
    
    func numberOfItems() -> Int {
        return favoriteBooks.count
    }
    
    func itemFor(row: Int) -> Books {
        return favoriteBooks[row]
    }
    
    func didSelectRow(_ row: Int, from controller: UIViewController) {
        let favoriteSelected = favoriteBooks[row]
        coordinatorDelegate?.didSelect(model: favoriteSelected, from: controller)
    }
    
    func didSelectClose(from controller: UIViewController) {
        coordinatorDelegate?.didSelectClose(from: self, from: controller)
    }
}
