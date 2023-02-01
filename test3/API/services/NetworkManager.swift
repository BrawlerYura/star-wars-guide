//
//  NetworkManager.swift
//  test3
//
//  Created by Admin on 31.01.2023.
//

import UIKit

protocol INetworkManager: NSObject {
    func loadData<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
    
    func loadData<T: Decodable>(urlRequest: URLRequest, completion: @escaping (Result<T, Error>) -> Void)
}

class NetworkManager: NSObject {
    
    private let session = URLSession(configuration: .default)
}

extension NetworkManager: INetworkManager {
    
    func loadData<T>(url: URL, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        let request = URLRequest(url: url)
        
        self.loadData(urlRequest: request, completion: completion)
    }
    
    func loadData<T>(urlRequest: URLRequest, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        let task = self.session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                }
            }
               
        }
        task.resume()
    }
}
