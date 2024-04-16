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
    
    static func fetchURL<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { result in
                let decoder = JSONDecoder()
                return try decoder.decode(APIResponse<T>.self, from: result.data)
            }
            .tryMap { result in
                result.results
            }
            .eraseToAnyPublisher()
    }
}
