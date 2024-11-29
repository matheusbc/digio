//
//  ViewCode.swift
//  Digio
//
//  Created by Matheus Campos on 26/11/24.
//

protocol ViewCode {
    /// Add all UIView subviews.
    func addSubviews()
    /// Setup all views constraints.
    func setupConstraints()
    /// Setup all views styles.
    func setupStyles()
}

extension ViewCode {
    /// Setup the UI.
    func setupView() {
        addSubviews()
        setupConstraints()
        setupStyles()
    }
}
