//
//  BooksListCollectionViewCell.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 02/03/21.
//

import UIKit

class BooksListCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "\(BooksListCollectionViewCell.self)"
    var book: BooksList? {
        didSet {
            updateCell()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell() {
        
    }

}
