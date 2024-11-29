//
//  ProductDetailsViewModelTests.swift
//  Digio
//
//  Created by Matheus Campos on 29/11/24.
//
import Testing
@testable import Digio

struct ProductDetailsViewModelTests {
    var viewModel: ProductDetailsViewModel!
    let productName: String = "Product name"
    let productImageURL: String = "http://test.com/i.png"
    let productDescription: String = "Product description"

    init () {
        let product = ProductItem(title: productName, imageURL: productImageURL, description: productDescription)
        viewModel = ProductDetailsViewModel(product: product)
    }

    @Test func getProductTest() async throws {
        // When get product
        let product = viewModel.getProduct()

        // Then
        #expect(product.title == productName)
        #expect(product.imageURL == productImageURL)
        #expect(product.description == productDescription)
    }

}
