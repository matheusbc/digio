//
//  NetworkError.swift
//  Digio
//
//  Created by Matheus Campos on 29/11/24.
//

enum NetworkError: Error {
    case invalidURL
    case networkError
    case invalidResponse
    case decodingError
    case serverError(String)
    case emptyData
    case unknownError
}
