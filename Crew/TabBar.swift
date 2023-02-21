//
//  TabBar.swift
//  Crew
//
//  Created by Alaa Alabdullah on 07/02/2023.
//

import SwiftUI

struct TabBar: View {
    var gridItems = [GridItem]()
    var body: some View {
        TabView {
            
            mainPage()
                .tabItem {
                    Label("Active Orders", systemImage: "leaf")
                }
            
            mainPage()
                .tabItem {
                    Label("Chat", systemImage: "rectangle.3.group.bubble.left")
                }
            ViewForm()
                .tabItem {
                    Label("Order History", systemImage: "Symbol")
                }
        }
        .accentColor(Color("ouryellow"))
        .background(.thinMaterial)
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            //  .cornerRadius(30)
            //     .ignoresSafeArea()
            //
        
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
