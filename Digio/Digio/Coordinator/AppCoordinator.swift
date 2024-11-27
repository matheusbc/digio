//
//  AppCoordinator.swift
//  Digio
//
//  Created by Matheus Campos on 25/11/24.
//

import UIKit

class AppCoordinator: Coordinator {
    // MARK: Public variables
    var partent: Coordinator?
    var childs: [Coordinator] = []
    var navigationController: UINavigationController

    // MARK: Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Public functions
    func start() {
        goToHome()
    }

    // MARK: Navigation functions
    func goToHome() {
        let viewModel = HomeViewModel()
        viewModel.coordinator = self
        let viewController = HomeViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
        viewModel.openProductDetails()
    }

    func goToProductDetails() {
        let viewModel = ProductDetailsViewModel()
        viewModel.coordinator = self
        let viewController = ProductDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }

    func goBack() {
        navigationController.popViewController(animated: true)
    }
}
