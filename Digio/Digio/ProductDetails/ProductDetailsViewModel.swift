//
//  ProductDetailsViewModel.swift
//  Digio
//
//  Created by Matheus Campos on 25/11/24.
//

class ProductDetailsViewModel {
    // MARK: Private properties
    private var product: ProductItem!

    // MARK: Public properties
    weak var coordinator: AppCoordinator!

    // MARK: Initializers
    init(product: ProductItem) {
        self.product = product
    }

    // MARK: - Public functions
    /// Get the given product object to show details.
    /// - Returns: The Product object.
    func getProduct() -> ProductItem {
        product
    }
}
