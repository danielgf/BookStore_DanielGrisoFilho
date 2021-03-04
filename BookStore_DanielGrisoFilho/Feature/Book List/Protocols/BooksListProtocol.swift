//
//  BooksListProtocol.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 02/03/21.
//
//  All rights reserved.
//

import UIKit

/// This is the protocol that our ViewModel’s should implement. It is conformed of two main parts.
/// The Data Source which will have all the formatted data the view controller needs,
/// and the Events which are events that the ViewController will send up to us on any user action.
protocol BooksListViewModelType: AnyObject {
    var viewDelegate: BooksListViewModelViewDelegate? { get set }
    /// Data Source
    
    /// This function will return the numbers of items you have on your ViewModel
    func numberOfItems() -> Int
    
    /// This function will show the item in a specific location on your ViewModel
    /// - Parameter row: Need to receive the index from your object
    func itemFor(row: Int) -> Books
    
    /// Events
    
    func start(page: Int)
    
    /// This function is used when the user select an row
    /// - Parameters:
    ///   - row: User row selection
    ///   - controller: Controller the input came from
    func didSelectRow(_ row: Int, from controller: UIViewController)
    
    /// This function when the selection action is finished
    /// - Parameter controller: Controller the input came from
    func didSelectClose(from controller: UIViewController)
}

/// This delegate protocol will let us communicate with the ViewController.
/// Whenever we have new data for example, we let the ViewController know so it can update it’s screen.
/// Since the view controller owns the ViewModel we don’t want to create a reference cycle
/// by holding onto a strong reference of the view controller.
/// So we have a delegate which is set by the view controller to itself when the ViewModel gets injected into it.
protocol BooksListViewModelViewDelegate: AnyObject {
    func updateScreen()
    func showError(error: Error)
}

/// This delegate protocol will let us bubble up any action’s that we can’t handle and must be handled by our coordinator.
/// This delegate should be set by the coordinator when it creates each corresponding ViewModel.
protocol BooksListViewModelCoordinatorDelegate: AnyObject {
    
    /// When you select an object this function will be triged
    /// - Parameters:
    ///   - model: Need to receive the model information from the object
    ///   - controller: Need to receive the viewController
    func didSelect(model: Books,
                   from controller: UIViewController)
    
    /// When close an object this function will be triged
    /// - Parameters:
    ///   - viewModel: Need to receive the ViewModel
    ///   - controller: Need to receive the viewController
    func didSelectClose(from viewModel: BooksListViewModel,
                        from controller: UIViewController)
}
