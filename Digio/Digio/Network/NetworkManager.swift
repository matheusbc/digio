//
//  NetworkManager.swift
//  Digio
//
//  Created by Matheus Campos on 29/11/24.
//
import Foundation

protocol NetworkManagerProtocol {
    func fetchData<T: Decodable>(config: RequestConfig, completion: @escaping (Result<T, NetworkError>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    func fetchData<T: Decodable>(config: RequestConfig, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: Endpoints.digioSandbox + config.path) else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = config.method.rawValue
        if let headers = config.headers {
            for (header, value) in headers {
                request.setValue(value, forHTTPHeaderField: header)

            }
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error)
                completion(.failure(.networkError))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }

            guard (200..<300).contains(httpResponse.statusCode) else {
                completion(.failure(.serverError("Server error with status code: \(httpResponse.statusCode)")))
                return
            }

            guard let data else {
                completion(.failure(.emptyData))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch let error {
                print(error)
                completion(.failure(.decodingError))
            }
        }

        task.resume()
    }
}
