//
//  FetchProductsUseCase.swift
//  Digio
//
//  Created by Matheus Campos on 29/11/24.
//
import Foundation

protocol FetchProductsUseCaseType {
    func request(completion: @escaping (Result<Products, NetworkError>) -> Void)
}

final class FetchProductsUseCase: FetchProductsUseCaseType {
    // MARK: - Variables
    private let networkManager: NetworkManagerProtocol

    // MARK: - Methods
    public init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    public func request(completion: @escaping (Result<Products, NetworkError>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            self.networkManager.fetchData(config: ProductsRequestConfig.getProducts, completion: completion)
        }
    }
}
