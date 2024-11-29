//
//  CoordinatorProtocol.swift
//  Digio
//
//  Created by Matheus Campos on 25/11/24.
//
import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get }

    func start()
}
