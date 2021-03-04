//
//  FavoriteBooksCoordinator.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 03/03/21.
//
//  All rights reserved.
//

import UIKit

class FavoriteBooksCoordinator: Coordinator, FavoriteBooksViewModelCoordinatorDelegate {
    
    lazy var favoriteViewModel: FavoriteBooksViewModel = {
        let viewModel = FavoriteBooksViewModel()
        viewModel.coordinatorDelegate = self
        return viewModel
    }()
    
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name:
                                        FavoriteBooksViewController.classIdentifier,
                                      bundle: nil)
        
        let viewController = storyboard.instantiateViewController(identifier:
                                                                    FavoriteBooksViewController.classIdentifier)
            as FavoriteBooksViewController
        viewController.viewModel = favoriteViewModel
        navigationController?.pushViewController(viewController, animated: true)
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
    
    func didSelectClose(from viewModel: FavoriteBooksViewModel, from controller: UIViewController) {
        
    }
}
