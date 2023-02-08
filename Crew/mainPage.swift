//
//  mainPage.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 06/02/2023.
//

import SwiftUI

struct mainPage: View {
    @State var cityName: String = ""
    var body: some View {
        VStack {
            headerView()
            VStack(alignment: .leading) {
                    Text("My Orders")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                        myOrderCard()
                    
//                    Divider()
                    Spacer()
//                ZStack{
//                    Text("Active Orders Near You")
//                        .font(.title2)
//                        .bold()
//                        .padding(.leading)
//                }
                    ScrollView(.horizontal, showsIndicators: false){
                        VStack(alignment: .leading) {
                        Text("Active Orders Near You")
                            .font(.title2)
                            .bold()
                            .padding(.leading)
                            HStack{
                                ForEach(0..<10) { index in
                                    orderCard()
                                    
                                }
                            }
                        }
                        
//                        .padding([.top,.bottom], 20)
//                        .frame(height: 300)
                        .padding(.leading)
                        .padding(.bottom, 30)
                        Spacer()
                }
                Spacer()
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
