//
//  NetworkManager.swift
//  Demo
//
//  Created by Renuka Pandey on 14/02/25.
//

import Foundation

import Foundation

enum NetworkError: Error {
    case noData
    case badResponse
    case decodingError
}

class NetworkManager {
    
    func fetchData(from url: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.badResponse))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Request failed: \(error.localizedDescription)")
                completion(.failure(.badResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }

    func decode<T: Decodable>(_ data: Data, to type: T.Type) -> Result<T, NetworkError> {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedData)
        } catch {
            return .failure(.decodingError)
        }
    }
}
