//
//  APIEnvironment.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 16/04/2024.
//

import Foundation

/// The environments available for the app. Determines if the real API will be used, or if a mock API must be consumed. Useful for debugging and testing.
enum APIEnvironment {
    case mock
    case prod
}
