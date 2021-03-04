//
//  MainCoordinator.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 02/03/21.
//
//  All rights reserved.
//

import UIKit

class MainCoordinator {
    
    var navigationController: UINavigationController?
    var tabBarController: UITabBarController?
    var childCoordinators: [Coordinator] = []
    
    required init(tabBarController: UITabBarController) {
        self.navigationController = tabBarController.navigationController
        self.tabBarController = tabBarController
    }
    
    func start() {
        
        var controllers: [UIViewController] = []
        
        let booksListCoordinator = BooksListCoordinator(navigationController:
                                                            navigationController ?? UINavigationController())
        booksListCoordinator.start()
        
        booksListCoordinator.navigationController?.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        childCoordinators.append(booksListCoordinator)
        
        let favoriteCoordinator = FavoriteBooksCoordinator(navigationController:
                                                            navigationController ?? UINavigationController())
        favoriteCoordinator.start()
        
        favoriteCoordinator.navigationController?.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        childCoordinators.append(favoriteCoordinator)
        
        controllers.append(booksListCoordinator.navigationController ?? UINavigationController())
        controllers.append(favoriteCoordinator.navigationController ?? UINavigationController())
        
        tabBarController?.setViewControllers(controllers, animated: true)
        tabBarController?.tabBar.isTranslucent = true
        
    }
}
