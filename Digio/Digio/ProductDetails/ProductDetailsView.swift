//
//  ProductDetailsView.swift
//  Digio
//
//  Created by Matheus Campos on 28/11/24.
//
import UIKit
import Kingfisher

/// Product Details UI.
final class ProductDetailsView: UIView {
    // MARK: UI elements
    private let headerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.contentMode = .scaleToFill
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .left
        label.text = "Label"
        label.textAlignment = .natural
        label.lineBreakMode = .byTruncatingTail
        label.baselineAdjustment = .alignBaselines
        label.adjustsFontSizeToFitWidth = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .topLeft
        label.textAlignment = .natural
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.baselineAdjustment = .alignBaselines
        label.adjustsFontSizeToFitWidth = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        return label
    }()

    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: Initializers
    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

// MARK: - Public functions
extension ProductDetailsView {
    /// Updates product's title on Product Details UI.
    /// - Parameter title: Product name.
    func updateTitle(_ title: String) {
        titleLabel.text = title
    }

    /// Updates product's image on Product Details UI.
    /// - Parameter imageURL: Product image URL string.
    func updateImage(_ imageURL: String) {
        let url = URL(string: imageURL)
        let processor = DownsamplingImageProcessor(size: productImage.bounds.size)
        KF.url(url)
            .placeholder(UIImage(named: "DigioLogo"))
            .setProcessor(processor)
            .retry(maxCount: 3)
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .onFailure { error in
                // Log the image loading error.
                print("Error loading image: \(String(describing: error.errorDescription))")
            }
            .set(to: productImage)
    }

    /// Updates product's description on Product Details UI..
    /// - Parameter description: Product description.
    func updateDescription(_ description: String) {
        descriptionLabel.text = description
    }
}

// MARK: - ViewCode functions
extension ProductDetailsView: ViewCode {
    func addSubviews() {
        headerStack.addArrangedSubview(productImage)
        headerStack.addArrangedSubview(titleLabel)
        addSubview(headerStack)
        addSubview(divider)
        addSubview(descriptionLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            headerStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            headerStack.heightAnchor.constraint(equalToConstant: 60),

            productImage.centerYAnchor.constraint(equalTo: headerStack.centerYAnchor),
            productImage.widthAnchor.constraint(equalTo: headerStack.heightAnchor),

            titleLabel.centerYAnchor.constraint(equalTo: headerStack.centerYAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            divider.topAnchor.constraint(equalTo: headerStack.bottomAnchor, constant: 10),
            divider.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            divider.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    func setupStyles() {
        backgroundColor = .white

        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)

        descriptionLabel.textColor = .black
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .semibold)
    }
}
