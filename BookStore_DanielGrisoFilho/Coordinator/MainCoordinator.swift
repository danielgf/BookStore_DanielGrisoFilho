//
//  MainCoordinator.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 02/03/21.
//
//  All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let booksListCoordinator = BooksListCoordinator(navigationController:
                                                            navigationController ?? UINavigationController())
        booksListCoordinator.start()
    }
}
