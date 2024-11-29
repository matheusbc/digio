//
//  RequestConfig.swift
//  Digio
//
//  Created by Matheus Campos on 29/11/24.
//

public protocol RequestConfig {
    var path: String { get }
    var method: HTTPMethod { get }
    var body: [String: Any]? { get }
    var headers: [String: String]? { get }
}
