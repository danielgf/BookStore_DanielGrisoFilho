//
//  BooksListService.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 02/03/21.
//
//  All rights reserved.
//

import UIKit

class BooksListService: BooksListAPIService {
    
    static let baseURL = "https://www.googleapis.com/"
    static let pathURL = "/v1/volumes"
    private let session = URLSession.shared
    
    init() {}
    
    func fetchBooks(endPoint: String, page: Int, completionHandler: @escaping (Result<[Books], Error>) -> Void) {
        
        let url = "\(BooksListService.baseURL)\(endPoint)\(BooksListService.pathURL)"
        let parameters = [
            URLQueryItem(name: "q", value: "ios"),
            URLQueryItem(name: "maxResults", value: "20"),
            URLQueryItem(name: "startIndex", value: "\(page)")
        ]
        
        var urlComponents = URLComponents(string: url)
        urlComponents?.queryItems = parameters
        
        guard let finalURL = urlComponents?.url else {
            completionHandler(.failure(NSError(domain: "failed parse url",
                                               code: 0, userInfo: nil)))
            return
        }
        
        session.dataTask(with: finalURL) { (data, _, _) in
            guard let safeData = data else {
                completionHandler(.failure(NSError(domain: "failed parse data",
                                                   code: 0, userInfo: nil)))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(BooksList.self, from: safeData)
                completionHandler(.success(result.items ?? []))
            } catch {
                completionHandler(.failure(error))
            }
        }.resume()

    }
}
