//
//  HomeView.swift
//  Digio
//
//  Created by Matheus Campos on 26/11/24.
//
import UIKit

class HomeView: UIView {
    // MARK: UI elements
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.clipsToBounds = true
        stackView.contentMode = .scaleToFill
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var spotlightCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 320, height: 156)
        layout.headerReferenceSize = CGSize(width: 0.0, height: 0.0)
        layout.footerReferenceSize = CGSize(width: 0.0, height: 0.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.clipsToBounds = true
        collectionView.isMultipleTouchEnabled = true
        collectionView.contentMode = .scaleAspectFit
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(HomeItemCell.self, forCellWithReuseIdentifier: HomeItemCell.cellIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 50)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private lazy var cashLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .left
        label.textAlignment = .natural
        label.lineBreakMode = .byTruncatingTail
        label.baselineAdjustment = .alignBaselines
        label.adjustsFontSizeToFitWidth = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        return label
    }()

    private lazy var cashCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 320, height: 94)
        layout.headerReferenceSize = CGSize(width: 0.0, height: 0.0)
        layout.footerReferenceSize = CGSize(width: 0.0, height: 0.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.clipsToBounds = true
        collectionView.isMultipleTouchEnabled = true
        collectionView.contentMode = .scaleAspectFit
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(HomeItemCell.self, forCellWithReuseIdentifier: HomeItemCell.cellIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 30)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private lazy var productsLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .left
        label.text = "Produtos"
        label.textAlignment = .natural
        label.lineBreakMode = .byTruncatingTail
        label.baselineAdjustment = .alignBaselines
        label.adjustsFontSizeToFitWidth = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        return label
    }()

    private lazy var productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 130, height: 130)
        layout.headerReferenceSize = CGSize(width: 0.0, height: 0.0)
        layout.footerReferenceSize = CGSize(width: 0.0, height: 0.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.clipsToBounds = true
        collectionView.isMultipleTouchEnabled = true
        collectionView.contentMode = .scaleAspectFit
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(HomeItemCell.self, forCellWithReuseIdentifier: HomeItemCell.cellIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 30)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "DigioLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 25
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .left
        label.setContentCompressionResistancePriority(UILayoutPriority(749), for: .horizontal)
        label.text = "Olá, Matheus!"
        label.textAlignment = .natural
        label.lineBreakMode = .byTruncatingTail
        label.baselineAdjustment = .alignBaselines
        label.adjustsFontSizeToFitWidth = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        return label
    }()

    // MARK: Initializers
    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public functions
extension HomeView {
    func setup(icon: UIImage, title: String) {
        iconImageView.image = icon
        titleLabel.text = title
    }

    func isSpotlightCollection(_ collection: UICollectionView) -> Bool {
        collection == spotlightCollectionView
    }

    func isCashCollection(_ collection: UICollectionView) -> Bool {
        collection == cashCollectionView
    }

    func isProductCollection(_ collection: UICollectionView) -> Bool {
        collection == productsCollectionView
    }

    func setSpotlightDataSource(_ dataSource: UICollectionViewDataSource) {
        spotlightCollectionView.dataSource = dataSource
    }

    func setCashDataSource(_ dataSource: UICollectionViewDataSource) {
        cashCollectionView.dataSource = dataSource
    }

    func setProductDataSource(_ dataSource: UICollectionViewDataSource) {
        productsCollectionView.dataSource = dataSource
    }

    func setSpotlightDelegate(_ delegate: UICollectionViewDelegate) {
        spotlightCollectionView.delegate = delegate
    }

    func setCashDelegate(_ delegate: UICollectionViewDelegate) {
        cashCollectionView.delegate = delegate
    }

    func setProductDelegate(_ delegate: UICollectionViewDelegate) {
        productsCollectionView.delegate = delegate
    }

    func reloadData() {
        spotlightCollectionView.reloadData()
        cashCollectionView.reloadData()
        productsCollectionView.reloadData()
    }
}

// MARK: - ViewCode functions
extension HomeView: ViewCode {
    func addSubviews() {
        headerStackView.addArrangedSubview(iconImageView)
        headerStackView.addArrangedSubview(titleLabel)
        addSubview(headerStackView)
        addSubview(spotlightCollectionView)
        addSubview(cashLabel)
        addSubview(cashCollectionView)
        addSubview(productsLabel)
        addSubview(productsCollectionView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            headerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            iconImageView.centerYAnchor.constraint(equalTo: headerStackView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),

            titleLabel.centerYAnchor.constraint(equalTo: headerStackView.centerYAnchor),

            spotlightCollectionView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 40),
            spotlightCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            spotlightCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            spotlightCollectionView.heightAnchor.constraint(equalToConstant: 160),

            cashLabel.topAnchor.constraint(equalTo: spotlightCollectionView.bottomAnchor, constant: 40),
            cashLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cashLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            cashCollectionView.topAnchor.constraint(equalTo: cashLabel.bottomAnchor, constant: 10),
            cashCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            cashCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            cashCollectionView.heightAnchor.constraint(equalToConstant: 98),

            productsLabel.topAnchor.constraint(equalTo: cashCollectionView.bottomAnchor, constant: 40),
            productsLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            productsLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            productsCollectionView.topAnchor.constraint(equalTo: productsLabel.bottomAnchor, constant: 20),
            productsCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            productsCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            productsCollectionView.heightAnchor.constraint(equalToConstant: 134)
        ])
    }

    func setupStyles() {
        backgroundColor = .white
        iconImageView.layer.borderColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [0, 0, 0, 0.3])
        titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        titleLabel.font = .systemFont(ofSize: 16, weight: .heavy)
        cashLabel.textColor = #colorLiteral(red: 0.1465134621, green: 0.1975485086, blue: 0.2813432813, alpha: 1)
        cashLabel.font = .systemFont(ofSize: 22, weight: .heavy)
        cashLabel.setColoredLabel(text: "digio Cash", textColors: [("Cash", #colorLiteral(red: 0.4745097756, green: 0.4745097756, blue: 0.4745097756, alpha: 1))])
        productsLabel.textColor = #colorLiteral(red: 0.1465134621, green: 0.1975485086, blue: 0.2813432813, alpha: 1)
        productsLabel.font = .systemFont(ofSize: 22, weight: .heavy)
    }
}
