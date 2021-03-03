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
    
    var viewModel: BooksListViewModelType? {
        didSet {
            viewModel?.coordinatorDelegate = self
        }
    }
    
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
        viewController.viewModel = BooksListViewModel()
        viewController.viewModel?.coordinatorDelegate = viewModel?.coordinatorDelegate
        navigationController?
            .pushViewController(viewController,
                                animated: true)
    }
    
    func didSelect(model: Books, from controller: UIViewController) {
        
    }
    
    func didSelectClose(from viewModel: BooksListViewModel, from controller: UIViewController) {
        
    }
}
