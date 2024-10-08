//
//  RegisterVm.swift
//  AsynAwait_Authentication
//
//  Created by Quick tech  on 04/10/24.
//

import Foundation

class RegisterVm {
    
    var register: Register!
    
    private let manager = ApiManager()
    
    func registeration(parameters: Register) {
        Task {
            do {
                let register = try await ApiManager.shared.request(modelType: SignUpResponse.self, type: EndPoitsItems.signUp(signUp: parameters))
                print(register)
            } catch {
                print("Eror : \(error)")
            }
        }
    }
}
