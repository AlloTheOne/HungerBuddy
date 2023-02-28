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
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var sessionServices = SessionServiceImpl()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch sessionServices.state {
                case .loggedIn:
//                    HomeView(restuFee: [])
                    TabBar()
//                    ContentView5()
                        .environmentObject(sessionServices)
                case .loggedOut:
                    LoginView()
                }
            }
           // ContentView()
//            MainView()
            //ContentView5()
            //ChatChannelListView()

                //.environmentObject(UserAuth())
        }
    }
}
