//
//  MockNavigationController.swift
//  Digio
//
//  Created by Matheus Campos on 29/11/24.
//
// import Testing
import UIKit
@testable import Digio

// Mock NavigationController to intercept push actions
class MockNavigationController: UINavigationController {
    var pushedViewControllers: [UIViewController] = []

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewControllers.append(viewController)
    }
}
