//
//  CrewApp.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 05/02/2023.
//

import SwiftUI
import Firebase
import StreamChat
import StreamChatSwiftUI


@main
struct CrewApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ChatChannelListView()

                //.environmentObject(UserAuth())
        }
    }
}
