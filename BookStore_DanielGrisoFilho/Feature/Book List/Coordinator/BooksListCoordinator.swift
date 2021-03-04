//
//  BooksListCoordinator.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 02/03/21.
//
//  All rights reserved.
//

import UIKit

class BooksListCoordinator: Coordinator, BooksListViewModelCoordinatorDelegate {
    
    lazy var booksViewModel: BooksListViewModel = {
        let viewModel = BooksListViewModel()
        viewModel.coordinatorDelegate = self
        return viewModel
    }()
    
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: BooksListCollectionViewController.classIdentifier,
                                      bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier:
                                                                    BooksListCollectionViewController
                                                                    .classIdentifier)
            as BooksListCollectionViewController
        viewController.viewModel = booksViewModel
        navigationController?
            .pushViewController(viewController,
                                animated: true)
    }
    
    func didSelect(model: Books, from controller: UIViewController) {
        let storyboard = UIStoryboard(name: BookDetailsViewController.classIdentifier,
                                      bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier:
                                                                    BookDetailsViewController
                                                                    .classIdentifier)
            as BookDetailsViewController
        viewController.book = model
        controller.showDetailViewController(viewController, sender: nil)
    }
    
    func didSelectClose(from viewModel: BooksListViewModel, from controller: UIViewController) {
        
    }
}
