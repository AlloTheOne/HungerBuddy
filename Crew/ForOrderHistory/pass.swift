//
//  pass.swift
//  Crew
//
//  Created by Abeer on 01/08/1444 AH.
//

import Foundation

class Whatever: ObservableObject {
    @Published var someText: String
    init(someText: String) {
        self.someText = someText
    }
}
