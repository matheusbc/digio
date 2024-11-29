//
//  HomeViewModel.swift
//  Digio
//
//  Created by Matheus Campos on 25/11/24.
//
import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didUpdateItems()
    func didFailWithError(_ error: Error)
}

class HomeViewModel {
    // MARK: Private properties
    private var homeData: ProductsData?
    private let networkManager = NetworkManager()

    // MARK: Public properties
    weak var coordinator: ProductDetailsProtocol?
    weak var delegate: HomeViewModelDelegate?

    // MARK: - Public functions
    /// Fetch products list to show in home screen.
    func fetchProducts() {
        FetchProductsUseCase(networkManager: networkManager).request { [weak self] result in
            if case .success(let products) = result {
                DispatchQueue.main.async {
                    self?.homeData = ProductsData(
                        spotlight: products.spotlight.map({
                            ProductItem(title: $0.name,
                                        imageURL: $0.bannerURL,
                                        description: $0.description)
                        }),
                        products: products.products.map({
                            ProductItem(title: $0.name,
                                        imageURL: $0.imageURL,
                                        description: $0.description)
                        }),
                        cash: ProductItem(title: products.cash.title,
                                          imageURL: products.cash.bannerURL,
                                          description: products.cash.description))
                    self?.delegate?.didUpdateItems()
                }
            } else if case .failure(let error) = result {
                self?.delegate?.didFailWithError(error)
            }
        }
    }

    /// Open product details screen for the selected product.
    /// - Parameter index: Selected product index.
    func showProductDetails(withIndex index: Int) {
        guard let products = homeData?.products, index < products.count else {
            print("Invalid product index: \(index)")
            return
        }
        coordinator?.showProductDetails(for: products[index])
    }

    /// Get the spotlight items list.
    /// - Returns: The Spotlight items list.
    func getSpotlightItems() -> [ProductItem] {
        homeData?.spotlight ?? []
    }

    /// Total number of spotlight items in the list.
    var numberOfSpotlightItems: Int {
        homeData?.spotlight.count ?? 0
    }

    /// Get the cash items list.
    /// - Returns: The Cash items list.
    func getCashItem() -> ProductItem {
        homeData?.cash ?? ProductItem(title: "", imageURL: "", description: "")
    }

    /// Total number of cash items in the list.
    var numberOfCashItems: Int {
        homeData?.cash != nil ? 1 : 0
    }

    /// Get the product items list.
    /// - Returns: The Product items list.
    func getProductItems() -> [ProductItem] {
        homeData?.products ?? []
    }

    /// Total number of products items in the list.
    var numberOfProductItems: Int {
        homeData?.products.count ?? 0
    }

    func selectedProduct(at index: Int) {
        guard let coordinator, let products = homeData?.products else { return }
        coordinator.showProductDetails(for: products[index])
    }
}
