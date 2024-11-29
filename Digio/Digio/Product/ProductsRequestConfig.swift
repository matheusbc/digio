//
//  ProductsRequestConfig.swift
//  Digio
//
//  Created by Matheus Campos on 29/11/24.
//

enum ProductsRequestConfig {
    case getProducts
}

extension ProductsRequestConfig: RequestConfig {
    var path: String {
        switch self {
        case .getProducts:
            return "/products"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getProducts:
            return .get
        }
    }
    var body: [String: Any]? {
        return nil
    }
    var headers: [String: String]? {
        ["Content-Type": "application/json",
         "Accept": "application/json" ]
    }
}
