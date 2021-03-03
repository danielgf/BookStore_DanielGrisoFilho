//
//  BooksListAPIService.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 02/03/21.
//
//  All rights reserved.
//

import UIKit

/// This protocol you will input all the functions that you wanto to perform a request
/// to get the data from the server
protocol BooksListAPIService {
    func fetchBooks(endPoint: String, page: Int,
                    completionHandler: @escaping (Result<BooksList, Error>) -> Void)
}
