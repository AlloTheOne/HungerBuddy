//
//  Order.swift
//  Crew
//
//  Created by Alaa Alabdullah on 27/02/2023.
//

import Foundation

struct Order: Identifiable {
    var id = UUID()
    var RName: String
    var Dfee: String
    var payment: String
    var appName: String
    var usid: String
}

