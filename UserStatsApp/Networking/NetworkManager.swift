//
//  NetworkManager.swift
//  UserStatsApp
//
//  Created by Manjula Pajaniraja on 03/03/21.
//

import Foundation

class NetworkManager {
    
    func getUserData(fromUrl url: String, completion: @escaping (Result<Data?, ErrorType>) -> Void) {
        let urlSession = URLSession.init(configuration: .default)
        guard let url  = URL(string: url), !url.absoluteString.isEmpty else {
            completion(.failure(.genericError))
            return
        }
        let urlRequest = URLRequest(url:url)
        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            if (response as? HTTPURLResponse)?.statusCode == 200 {
                if let data = data {
                    completion(.success(data))
                }
            } else {
                completion(.failure(.genericError))
            }
        }.resume()
    }
}
