////
////  TabView.swift
////  Crew
////
////  Created by Alaa Alabdullah on 07/02/2023.
////
//
//import SwiftUI
//
//struct TabView: View {
//    @State private var selectedIndex = 0
//    var body: some View {
//        TabView(selection: $selectedIndex){
//            ContentView()
//                .onTapGesture {
//                    self.selectedIndex = 0
//                }
//                .tabItem{
//                    Image(systemName: "leaf")
//                    Text("Habits")
//                }.tag(0)
//            
//            mainPage()
//                .onTapGesture {
//                    self.selectedIndex = 1
//                }
//                .tabItem{
//                    Image(systemName: "rectangle.3.group.bubble.left")
//                    Text("Community")
//                    
//                }.tag(1)
//            
//        }
//    }
//}
//struct TabView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabView()
//    }
//}
