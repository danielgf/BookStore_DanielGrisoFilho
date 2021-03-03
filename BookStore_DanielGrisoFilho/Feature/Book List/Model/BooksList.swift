//
//  BooksList.swift
//  BookStore_DanielGrisoFilho
//
//  Created by Daniel Griso Filho on 02/03/21.
//
//  All rights reserved.
//

import Foundation

struct BooksList: Codable {
    var king: String?
    var totalItems: Double?
    var items: [Books]?
}

struct Books: Codable {
    var kind: String?
    var id: String?
    var etag: String?
    var selfLink: String?
    var volumeInfo: VolumeInfo?
    var saleInfo: SaleInfo?
    var accessInfo: AccessInfo?
    var searchInfo: SearchInfo?
}

struct VolumeInfo: Codable {
    var title: String?
    var authors: [String]?
    var publisher: String?
    var publishedDate: String?
    var description: String?
    var industryIdentifiers: [IndustryIdentifiers]?
    var readingModes: ReadingModes?
    var pageCount: Double?
    var printType: String?
    var categories: [String]?
    var averageRating: Int?
    var ratingsCount: Int?
    var maturityRating: String?
    var allowAnonLogging: Bool?
    var contentVersion: String?
    var panelizationSummary: PanelizationSummary?
    var imageLinks: ImageLinks?
    var language: String?
    var previewLink: String?
    var infoLink: String?
    var canonicalVolumeLink: String?
    
}

struct IndustryIdentifiers: Codable {
    var type: String?
    var identifier: String?
}

struct ReadingModes: Codable {
    var text: Bool?
    var image: Bool?
}

struct PanelizationSummary: Codable {
    var containsEpubBubbles: Bool?
    var containsImageBubbles: Bool?
}

struct ImageLinks: Codable {
    var smallThumbnail: String?
    var thumbnail: String?
}

struct SaleInfo: Codable {
    var country: String?
    var saleability: String?
    var isEbook: Bool?
}

struct AccessInfo: Codable {
    var country: String?
    var viewability: String?
    var embeddable: Bool?
    var publicDomain: Bool?
    var textToSpeechPermission: String?
    var epub: Epub?
    var pdf: Pdf?
    var webReaderLink: String?
    var accessViewStatus: String?
    var quoteSharingAllowed: Bool?
}

struct Epub: Codable {
    var isAvailable: Bool?
}

struct Pdf: Codable {
    var isAvailable: Bool?
}

struct SearchInfo: Codable {
    var textSnippet: String?
}
