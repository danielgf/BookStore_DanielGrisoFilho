//
//  BookDetailsViewController.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 03/03/21.
//
//  All rights reserved.
//

import UIKit

class BookDetailsViewController: UIViewController {
    
    // MARK: - Variables and Properties
    static let classIdentifier = "\(BookDetailsViewController.self)"
    var book: Books? {
        didSet {
            updateView()
        }
    }
    let favorite = FavoriteBooks.shared
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var bookDescription: UITextView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFavoriteStar()
    }
    
    private func updateView() {
        DispatchQueue.main.async {
            self.bookTitle.text = self.book?.volumeInfo?.title
            self.bookDescription.text = self.book?.volumeInfo?.description
            self.bookAuthor.text = self.book?.volumeInfo?.authors?.joined(separator: ", ")
            self.updateImage()
            self.updateBuyButton()
        }
    }
    
    private func updateBuyButton() {
        if book?.saleInfo?.saleability != "NOT_FOR_SALE" {
            buyButton.isHidden = false
            buyButton.isEnabled = true
        } else {
            buyButton.isHidden = true
            buyButton.isEnabled = false
        }
    }
    
    private func updateImage() {
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
    
    private func updateFavoriteStar() {
        if favorite.verifyFavorite(book) {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    @IBAction func buyBook(_ sender: UIButton) {
        if let url = URL(string: book?.saleInfo?.buyLink ?? "") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBAction func addRemoveFavorite(_ sender: UIButton) {
        if sender.currentImage == UIImage(systemName: "star") {
            sender.setImage(UIImage(systemName: "star.fill"), for: .normal)
            favorite.addBookAsFavorite(book)
        } else {
            sender.setImage(UIImage(systemName: "star"), for: .normal)
            favorite.removeBookAsFavorite(book)
        }
    }
    
}
