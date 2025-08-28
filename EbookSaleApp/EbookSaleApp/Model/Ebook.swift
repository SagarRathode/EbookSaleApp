//
//  Ebook.swift
//  EbookSaleApp
//
//  Created by Sagar Rathode   on 22/08/25.
//

import Foundation
struct Ebook: Identifiable, Codable, Equatable {
    let id: UUID = UUID()
    let title: String
    let author: String
    let price: Double
    let cover: String      // SF Symbol or image asset name
    let description: String
    let fileName: String   // PDF file name inside your app bundle
}




struct Order: Identifiable {
    let id = UUID()
    let book: Ebook
    let date: Date
}
