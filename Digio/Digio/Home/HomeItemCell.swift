//
//  ProductCell.swift
//  Digio
//
//  Created by Matheus Campos on 28/11/24.
//
import UIKit
import Kingfisher

class HomeItemCell: UICollectionViewCell {
    // MARK: Static properties
    static let cellIdentifier = "HomeItemCell"

    // MARK: UI elements
    private lazy var cardView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        return view
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "DigioLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.kf.indicatorType = .activity
        return imageView
    }()

    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

// MARK: - ViewCode functions
extension HomeItemCell: ViewCode {
    func addSubviews() {
        cardView.addSubview(imageView)
        contentView.addSubview(cardView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),

            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2)

        ])
    }

    func setupStyles() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0
    }
}

// MARK: - Public functions
extension HomeItemCell {
    /// Setup the cell information to show.
    /// - Parameters:
    ///   - item: Home item information to show.
    ///   - widthRatio: Width ratio for the image.
    public func configure(with item: ProductItemProtocol, and widthRatio: CGFloat) {
        let url = URL(string: item.imageURL)
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
        KF.url(url)
            .setProcessor(processor)
            .retry(maxCount: 3)
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .onFailure { [weak self] error in
                // Log the image loading error.
                print("Error loading image: \(String(describing: error.errorDescription))")
                self?.imageView.image = UIImage(named: "DigioLogo")
            }
            .set(to: imageView)
        self.imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: widthRatio).isActive = true
    }
}
