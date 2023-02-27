//
//  RegistrationDetails.swift
//  Crew
//
//  Created by Alaa Alabdullah on 26/02/2023.
//

import Foundation


struct RegistrationDetails {
    var email: String
    var password: String
    var name: String
    var usid: String
}


extension RegistrationDetails {
    static var new: RegistrationDetails {
        RegistrationDetails(email: "", password: "", name: "", usid: "")
    }
}
