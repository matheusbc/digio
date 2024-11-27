//
//  HomeViewModel.swift
//  Digio
//
//  Created by Matheus Campos on 25/11/24.
//

class HomeViewModel {
    weak var coordinator: AppCoordinator!

    func openProductDetails() {
        coordinator.goToProductDetails()
    }
}
