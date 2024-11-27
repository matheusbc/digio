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
        stackView.contentMode = .scaleToFill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
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

    // MARK: View Lifecycle
    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Public functions
    func setup(icon: UIImage, title: String) {
        iconImageView.image = icon
        titleLabel.text = title
    }
}

extension HomeView: ViewCode {
    func addSubviews() {
        headerStackView.addArrangedSubview(iconImageView)
        headerStackView.addArrangedSubview(titleLabel)
        addSubview(headerStackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: headerStackView.leadingAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: headerStackView.centerYAnchor),
            iconImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 50),
            iconImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 50),

            titleLabel.trailingAnchor.constraint(equalTo: headerStackView.trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: headerStackView.centerYAnchor),

            headerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            headerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }

    func setupStyles() {
        backgroundColor = .white
        iconImageView.backgroundColor = .white
        iconImageView.layer.borderColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [0, 0, 0, 0.3])
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: .init(16), weight: .bold)
    }
}
