//
//  BooksListCollectionViewCell.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 02/03/21.
//

import UIKit

class BooksListCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "\(BooksListCollectionViewCell.self)"
    var book: Books? {
        didSet {
            updateCell()
        }
    }
    @IBOutlet weak var bookImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bookImage.image = nil
    }
    
    func updateCell() {
        if let url = URL(string: book?.volumeInfo?.imageLinks?.thumbnail ?? "") {
            DispatchQueue.global().async {
                guard let imageData = try? Data(contentsOf: url) else { return }
                
                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                    self.bookImage.image = image
                }
            }
        }
    }
}
