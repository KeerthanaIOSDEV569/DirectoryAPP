//
//  APIError.swift
//  DirectoryApp
//
//  Created by Siddu Lakshmi Keerthana on 24/10/22.
//

import Foundation

/// Define your custom errors
enum ApiError: Error {
    case invalidPath
}

extension ApiError {
    
    var description: String {
        switch self {
        case .invalidPath:
            return "Invalid Path"
        }
    }
}
