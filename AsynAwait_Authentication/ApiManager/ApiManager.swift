//
//  ApiManager.swift
//  AsynAwait_Authentication
//
//  Created by Quick tech  on 04/10/24.
//

import Foundation

enum DataError: Error {
    case invalidURL
    case invalidResponse
    case inValidData
    case networ(Error?)
}

class ApiManager {
    
    static let shared = ApiManager()
    
    func request<T: Codable>(
        modelType: T.Type,
        type: EndPointType
    ) async throws -> T {
        guard let url = type.url else { throw DataError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = type.methods.rawValue
        if let parameters = type.body {
            request.httpBody = try JSONEncoder().encode(parameters)
        }
        request.allHTTPHeaderFields = type.headers
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                guard 200...299 ~= httpResponse.statusCode else {
                    throw DataError.invalidResponse
                }
            }
            
            let decodeData = try JSONDecoder().decode(modelType, from: data)
            return decodeData
        } catch {
            throw DataError.networ(error)
        }
    }
    
    static var commomHeaders: [String: String] {
        return ["Content-Type": "application/json"]
    }
}
