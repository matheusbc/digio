//
//  ProductDetailsViewModel.swift
//  Digio
//
//  Created by Matheus Campos on 25/11/24.
//

class ProductDetailsViewModel {
    weak var coordinator: AppCoordinator!

    func goToHome() {
        coordinator.goToHome()
    }
}
