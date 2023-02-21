//
//  orderCard.swift
//  Crew
//
//  Created by Alaa Alabdullah on 06/02/2023.
//

import SwiftUI

struct orderCard: View {
    @EnvironmentObject var userAuth: UserAuth
    @State var showChat: Bool = false
    var body: some View {
      
            VStack {
                VStack{
                    HStack{
                        Text("McDonald's")
                            .bold()
                        Spacer()
                        Image(systemName: "timer")
                        Text("4 min")
                            .font(.caption)
                        
                    }
                    .padding(.bottom, 5)
                    HStack{
                        Image(systemName: "car")
                        Text("20 SAR")
                            .font(.caption)
                        Spacer()
                        Image(systemName: "dollarsign")
                        Text("6 per one")
                            .font(.caption)
                        
                    }
                    .padding(.bottom, 5)
                    HStack{
                        Image(systemName: "creditcard")
                        Text("STC Pay, Alrajhi")
                            .font(.caption)
                        Spacer()
                        Image(systemName: "location")
                        Text("6.2")
                            .font(.caption)
                        
                    }
                    .padding(.bottom, 5)
                    HStack{
                        Image(systemName: "arrow.up.forward.app")
                        Text("Jahez")
                            .font(.caption)
                        Spacer()
                        Image(systemName: "person.3.sequence")
                        Text("3-4")
                            .font(.caption)
                        
                    }
                    .padding(.bottom)
                    
                    
                    Button {
//                        if !userAuth.isLoggedin {
//                        MainView()
//                    } else {
//                        mainPage()
//                    }
//
                    showChat = true
                    } label: {
                        Text("Join")
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(Color("ouryellow"))
                            .cornerRadius(10)
                    }

                    
//                    Button {
//
//                    } label: {
//
//
//                    }
                    
                }
                .padding()
                .frame(width: 250, height: 215)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: Color("shadow"), radius: 25, x: 0, y: 0)
                .padding(5)
            }
        }
    }


struct orderCard_Previews: PreviewProvider {
    static var previews: some View {
        orderCard()
    }
}
