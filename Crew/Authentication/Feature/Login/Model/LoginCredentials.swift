//
//  LoginCredentials.swift
//  Crew
//
//  Created by Alaa Alabdullah on 26/02/2023.
//

import Foundation


struct LoginCredentials {
    var email: String
    var password: String
}


extension LoginCredentials {
    
    static var new: LoginCredentials {
        LoginCredentials(email: "", password: "")
    }
}
