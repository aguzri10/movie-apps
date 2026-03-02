//
//  Errors.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 02/03/26.
//

import Foundation

enum APIConfigError: Error, LocalizedError {
    case fileNotfound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotfound:
            return "API configuration file not found"
        case .dataLoadingFailed(underlyingError: let error):
            return "Failed to load API configuration data: \(error)"
        case .decodingFailed(underlyingError: let error):
            return "Failed to decode API configuration: \(error)"
        }
    }
}

enum NetworkError: Error, LocalizedError {
    case badURLResponse(underlyingError: Error)
    case missingConfig
    case urlBuildFailed
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse(underlyingError: let error):
            return "Bad URL response: \(error)"
        case .missingConfig:
            return "API configuration is missing"
        case .urlBuildFailed:
            return "Failed to build URL"
        }
    }
}
