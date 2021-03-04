//
//  FavoriteBooksCollectionViewController.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 03/03/21.
//
//  All rights reserved.
//

import UIKit

class FavoriteBooksViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Variables and Properties
    static let classIdentifier = "\(FavoriteBooksViewController.self)"
    
    var viewModel: FavoriteBooksViewModelType? {
        didSet {
            viewModel?.viewDelegate = self
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        registerCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.start()
    }
    
    private func registerCells() {
        
        collectionView.register(UINib(nibName: BooksListCollectionViewCell.cellIdentifier,
                                      bundle: nil),
                                forCellWithReuseIdentifier: BooksListCollectionViewCell.cellIdentifier)
    }
    
    private func setupNavigationBar() {
        title = "Favorite Books"
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
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  60
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.didSelectRow(indexPath.row, from: self)
    }
}
// MARK: - Conforming to FavoriteBooksViewModelViewDelegate protocol
extension FavoriteBooksViewController: FavoriteBooksViewModelViewDelegate {
    func updateScreen() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
