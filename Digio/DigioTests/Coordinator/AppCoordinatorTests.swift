//
//  AppCoordinatorTests.swift
//  Digio
//
//  Created by Matheus Campos on 29/11/24.
//
import Testing
@testable import Digio

struct AppCoordinatorTests {
    var coordinator: AppCoordinator!
    var mockNavigationController: MockNavigationController!

    init() {
        mockNavigationController = MockNavigationController()
        coordinator = AppCoordinator(navigationController: mockNavigationController)
    }

    /// Test coordinator start method.
    @Test func testCoordinatorStart() {
        // Given
        let expectedViewControllerType = HomeViewController.self

        // When start coordinator
        coordinator.start()

        // Then
        #expect(mockNavigationController.pushedViewControllers.count == 1)
        #expect(mockNavigationController.pushedViewControllers.first!.isKind(of: expectedViewControllerType))
    }

    /// Test coordinator start method.
    @Test func testCoordinator() {
        // Given
        let expectedViewControllerType = ProductDetailsViewController.self
        let product = ProductItem(title: "Product test name", imageURL: "test.image.url", description: "Description")

        // When start coordinator
        coordinator.showProductDetails(for: product)

        // Then
        #expect(mockNavigationController.pushedViewControllers.count == 1)
        #expect(mockNavigationController.pushedViewControllers.first!.isKind(of: expectedViewControllerType))
    }
}
