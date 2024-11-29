//
//  HomeData.swift
//  Digio
//
//  Created by Matheus Campos on 29/11/24.
//

/// Home data structure.
/// Contains all data for home screen. List of spotlight, list of products, and list of cash.
struct ProductsData {
    let spotlight: [ProductItem]
    let products: [ProductItem]
    let cash: ProductItem
}

/// Product data structure.
struct ProductItem: ProductItemProtocol {
    var title: String
    var imageURL: String
    var description: String
}
