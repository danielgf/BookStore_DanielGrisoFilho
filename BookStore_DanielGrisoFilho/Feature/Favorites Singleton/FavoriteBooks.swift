//
//  FavoriteBooks.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 03/03/21.
//

import Foundation

class FavoriteBooks {
    
    static let shared = FavoriteBooks()
    
    var favoriteBooks = [Books]()
    
    func addBookAsFavorite(_ book: Books?) {
        if favoriteBooks.isEmpty {
            favoriteBooks.append(book ?? Books())
        } else if favoriteBooks.contains(where: { return $0.id != book?.id }) {
            favoriteBooks.append(book ?? Books())
        }
        print(favoriteBooks.count)
        favoriteBooks.forEach({ print($0.id ?? "")})
    }
    
    func removeBookAsFavorite(_ book: Books?) {
        favoriteBooks.removeAll(where: { return $0.id == book?.id })
        print(favoriteBooks.count)
        favoriteBooks.forEach({ print($0.id ?? "")})
    }
    
    func verifyFavorite(_ book: Books?) -> Bool {
        favoriteBooks.contains(where: { return $0.id == book?.id })
    }
    
}
