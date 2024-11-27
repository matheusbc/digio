//
//  ViewCode.swift
//  Digio
//
//  Created by Matheus Campos on 26/11/24.
//

protocol ViewCode {
    func addSubviews()
    func setupConstraints()
    func setupStyles()
}

extension ViewCode {
    func setupView() {
        addSubviews()
        setupConstraints()
        setupStyles()
    }
}
