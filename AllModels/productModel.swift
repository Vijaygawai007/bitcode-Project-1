//
//  productModel.swift
//  bitcode-Project-1
//
//  Created by Prince's Mac on 25/04/23.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
