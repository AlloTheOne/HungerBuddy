//
//  mainPage.swift
//  Crew
//
//  Created by Alaa Alabdullah on 06/02/2023.
//

import SwiftUI

struct mainPage: View {
    var body: some View {
        VStack {
            headerView()
    
            VStack(alignment: .leading) {
                
                    Text("My Orders")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                
                    VStack(alignment: .center)  {
                        myOrderCard()
                    }
//                    Divider()
                    Spacer()
                    Text("Active Orders Near You")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0..<10) { index in
                                orderCard()
                            }
                          
                        }
                        .padding([.top,.bottom], 40)
                        .padding(.leading)
                    
                }
                Spacer()
                
            }
            Spacer()
        }
    }
}

struct mainPage_Previews: PreviewProvider {
    static var previews: some View {
        mainPage()
    }
}
