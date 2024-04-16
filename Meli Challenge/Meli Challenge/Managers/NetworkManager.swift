//
//  NetworkManager.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import Foundation
import Combine

/// Encapsulates logic related to Networking.
class NetworkManager {
    static let apiEnvironment = APIEnvironment.prod
    static let baseURL = URL(string: "https://api.mercadolibre.com/sites/MLA")!
        
    static func fetchURL2<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { result in
                guard let response = result.response as? HTTPURLResponse, response.statusCode == 200 else {
                    // Here we should manage all possible errors appropriately
                    throw URLError(.badServerResponse)
                }
                return result.data
            }
            .decode(type: APIResponse<T>.self, decoder: JSONDecoder())
            .map {
                $0.results
            }.eraseToAnyPublisher()
    }
}
