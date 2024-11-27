//
//  Coordinator.swift
//  Digio
//
//  Created by Matheus Campos on 25/11/24.
//
import UIKit

protocol Coordinator {
    var partent: Coordinator? { get }
    var childs: [Coordinator] { get }
    var navigationController: UINavigationController { get }

    func start()
}
