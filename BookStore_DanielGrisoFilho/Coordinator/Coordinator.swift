//
//  Coordinator.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 02/03/21.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    init(navigationController: UINavigationController)
    
    func start()
}
