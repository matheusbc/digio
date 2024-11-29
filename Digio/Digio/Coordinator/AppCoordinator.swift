//
//  AppCoordinator.swift
//  Digio
//
//  Created by Matheus Campos on 25/11/24.
//

import UIKit

/// App main coordinator.
class AppCoordinator: CoordinatorProtocol, ProductDetailsProtocol {
    // MARK: Public properties
    var navigationController: UINavigationController

    // MARK: Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Public functions
    /// Start the first app view controller (HomeViewController).
    func start() {
        showHome()
    }

    // MARK: Navigation functions
    /// Show home screen (push to the navigation controller).
    func showHome() {
        let viewModel = HomeViewModel()
        viewModel.coordinator = self
        let viewController = HomeViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }

    /// Show product details screen (push to the navigation controller).
    func showProductDetails(for product: ProductItem) {
        let viewModel = ProductDetailsViewModel(product: product)
        viewModel.coordinator = self
        let viewController = ProductDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
