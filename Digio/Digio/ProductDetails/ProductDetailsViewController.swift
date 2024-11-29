//
//  ProductDetailsViewController.swift
//  Digio
//
//  Created by Matheus Campos on 25/11/24.
//
import UIKit

class ProductDetailsViewController: UIViewController {
    // MARK: Private properties
    private var viewModel: ProductDetailsViewModel!
    private lazy var productDetailsView: ProductDetailsView = {
        return ProductDetailsView()
    }()

    // MARK: - View Lifecycle
    init(viewModel: ProductDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        setupUI()
        self.view = productDetailsView
    }

    // MARK: - Private functions
    /// Setup Product Details UI. Updates all information the the UIView needs to show.
    private func setupUI() {
        let product = viewModel.getProduct()
        productDetailsView.updateTitle(product.title)
        productDetailsView.updateImage(product.imageURL)
        productDetailsView.updateDescription(product.description)
        self.view = productDetailsView
    }
}
