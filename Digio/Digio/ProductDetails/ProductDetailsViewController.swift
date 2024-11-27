//
//  ProductDetailsViewController.swift
//  Digio
//
//  Created by Matheus Campos on 25/11/24.
//
import UIKit

class ProductDetailsViewController: UIViewController {
    // MARK: Private variables
    private var viewModel: ProductDetailsViewModel!

    // MARK: - View Lifecycle
    init(viewModel: ProductDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Public functions
    func goBack() {
        viewModel.goToHome()
    }
}
