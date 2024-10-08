//
//  Register.swift
//  AsynAwait_Authentication
//
//  Created by Quick tech  on 04/10/24.
//

import Foundation

struct Register: Codable {
    var first_name: String
    var last_name: String
    var email: String
    var password: String
}

struct SignUpResponse: Codable {
    let success: Bool
    let message: String
}
