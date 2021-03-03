//
//  BooksListCollectionViewController.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 02/03/21.
//
//  All rights reserved.
//

import UIKit

class BooksListCollectionViewController: UICollectionViewController {
    
    static let classIdentifier = "\(BooksListCollectionViewController.self)"
    
    // MARK: - Variables and Properties
    var viewModel: BooksListViewModelType? {
        didSet {
            viewModel?.viewDelegate = self
        }
    }
    var requestPage = 0
    
    // MARK: - Life cycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.start(page: requestPage)
        setupNavigationBar()
        registerCells()
    }
    
    private func registerCells() {
        
        collectionView.register(UINib(nibName: BooksListCollectionViewCell.cellIdentifier,
                                      bundle: nil),
                                forCellWithReuseIdentifier: BooksListCollectionViewCell.cellIdentifier)
    }
    
    private func setupNavigationBar() {
        title = "Book Store"
    }
    
    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return viewModel?.numberOfItems() ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                BooksListCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? BooksListCollectionViewCell
        else { return UICollectionViewCell() }
        // Configure the cell
        cell.book = viewModel?.itemFor(row: indexPath.row)
        return cell
    }
}
// MARK: - Conforming to BooksListViewModelViewDelegate protocol
extension BooksListCollectionViewController: BooksListViewModelViewDelegate {
    func updateScreen() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Ops, something went wrong",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
