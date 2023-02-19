//
//  ContentView.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 05/02/2023.
//

import SwiftUI

struct  ContentView: View {
    
    @State var isActive : Bool = false
        @State private var size = 0.5
        @State private var opacity = 0.5
        
        @AppStorage("isUserOnboarded") var isUserOnboarded: Bool = false
    @EnvironmentObject var userAuth: UserAuth
        var body: some View {
            
            if isActive {
                if !isUserOnboarded {
                    MainView()
                } else {
                    MainView()
                }

                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(0.5, contentMode: .fit)
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.2)) {
                                self.size = 1.00
                                self.opacity = 1.00
      Text("**Hunger Buddy**")
            .font(Font.largeTitle)
                            }
                        }
                    
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                                withAnimation {
                                    self.isActive = true
                                }
                            
                        }
                }
            }
            
            
        }
    }

    struct LoadingView_Previews: PreviewProvider {
        static var previews: some View {
            
             ContentView()
        }
    }
