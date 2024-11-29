//
//  HomeItemProtocol.swift
//  Digio
//
//  Created by Matheus Campos on 27/11/24.
//

/// Protocol for the item shown in the Carousel from home screen.
protocol ProductItemProtocol {
    var title: String { get }
    var imageURL: String { get }
    var description: String { get }
}
