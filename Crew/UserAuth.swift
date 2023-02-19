//
//  UserAuth.swift
//  Crew
//
//  Created by Alaa Alabdullah on 16/02/2023.
//

import Combine

class UserAuth: ObservableObject {
    
    @Published var isLoggedin: Bool = false
    
    func login() {
        self.isLoggedin = true
    }
}

