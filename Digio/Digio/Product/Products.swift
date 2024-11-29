//
//  Product.swift
//  Digio
//
//  Created by Matheus Campos on 29/11/24.
//

struct Products: Decodable {
    let spotlight: [Spotlight]
    let products: [Product]
    let cash: Cash
}

/// Spotlight data structure.
struct Spotlight: Decodable {
    let name: String
    let bannerURL: String
    let description: String
}

/// Product data structure.
struct Product: Decodable {
    let name: String
    let imageURL: String
    let description: String
}

/// Cash data structure.
struct Cash: Decodable {
    let title: String
    let bannerURL: String
    let description: String
}
