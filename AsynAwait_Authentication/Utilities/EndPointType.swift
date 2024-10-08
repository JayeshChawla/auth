//
//  EndPointType.swift
//  AsynAwait_Authentication
//
//  Created by Quick tech  on 08/10/24.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path: String { get }
    var baseUrl: String { get }
    var url: URL? { get }
    var methods: HTTPMethods { get }
    var body: Encodable? { get }
    var headers: [String: String]? { get }
}

enum EndPoitsItems {
    case signUp(signUp: Register)
}

extension EndPoitsItems: EndPointType {
    var path: String {
        switch self {
        case .signUp:
            return "user/signup"
        }
    }
    
    var baseUrl: String {
        return "https://c0c0-2405-201-200c-9193-b92d-12b4-58d2-a8cd.ngrok-free.app/api/v1/"
    }
    
    var url: URL? {
        return URL(string: "\(baseUrl)\(path)")
    }
    
    var methods: HTTPMethods {
        switch self {
        case .signUp:
            return .post
        }
    }
    
    var body: (any Encodable)? {
        switch self {
        case .signUp(let register):
            return register
        }
    }
    
    var headers: [String : String]? {
        ApiManager.commomHeaders
    }
    
    
}
