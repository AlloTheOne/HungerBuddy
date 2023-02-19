//
//  CrewApp.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 05/02/2023.
//

import SwiftUI
import Firebase

@main
struct CrewApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            mainPage()
                .environmentObject(UserAuth())
        }
    }
}
