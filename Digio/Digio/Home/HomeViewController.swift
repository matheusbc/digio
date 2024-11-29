//
//  HomeViewController.swift
//  Digio
//
//  Created by Matheus Campos on 25/11/24.
//
import UIKit

class HomeViewController: UIViewController {
    // MARK: Private variables
    private var viewModel: HomeViewModel!
    private lazy var homeView: HomeView = {
        return HomeView()
    }()

    // MARK: - View Lifecycle
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        setCollectionViewsDataSource()
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // The name should come from the logged user info.
        homeView.setup(icon: UIImage(named: "DigioLogo")!, title: "Olá, Matheus")
        viewModel.fetchProducts()
        bindViewModel()
    }

    // MARK: Private functions
    /// Set this view controller as data source for the collection views in the home view.
    private func setCollectionViewsDataSource() {
        homeView.setSpotlightDataSource(self)
        homeView.setCashDataSource(self)
        homeView.setProductDataSource(self)
        homeView.setProductDelegate(self)
    }

    private func bindViewModel() {
        viewModel.delegate = self
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func didUpdateItems() {
        homeView.reloadData()
    }

    func didFailWithError(_ error: any Error) {
        // Handle error
    }
}

// MARK: - Collection view data source
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if homeView.isSpotlightCollection(collectionView) {
            return viewModel.numberOfSpotlightItems
        } else if homeView.isCashCollection(collectionView) {
            return viewModel.numberOfCashItems
        }
        return viewModel.numberOfProductItems
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCell.cellIdentifier,
                                                            for: indexPath) as? HomeItemCell else {
            return UICollectionViewCell()
        }

        var item: ProductItemProtocol
        var widthRatio: CGFloat = 0.4
        if homeView.isSpotlightCollection(collectionView) {
            item = viewModel.getSpotlightItems()[indexPath.row]
            widthRatio = 1
        } else if homeView.isCashCollection(collectionView) {
            item = viewModel.getCashItem()
            widthRatio = 1
        } else {
            item = viewModel.getProductItems()[indexPath.row]
        }
        cell.configure(with: item, and: widthRatio)

        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectedProduct(at: indexPath.row)
    }
}
