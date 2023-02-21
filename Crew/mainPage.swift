//
//  mainPage.swift
//  Crew
//
//  Created by Alaa Alabdullah on 06/02/2023.
//

import SwiftUI

struct mainPage: View {
    @State private var isPresentedFullScreenCover = false
    var body: some View {
        NavigationView {
            VStack {
                headerView()
                VStack(alignment: .leading) {
                    Text("My Orders")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                    emptyOrderCard
                    

                    Spacer()

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
    var emptyOrderCard : some View {
        VStack {
          
                VStack{
                    HStack{

//                        }
                        Text("You Have No Order Yet")
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .bold()
                            .padding(.horizontal, 50.0)
                        
                        
                    }
                    
                 
                    
             NavigationLink(destination: FORM()) {
                    Text("Create Your Order")
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color("ouryellow"))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }.navigationBarBackButtonHidden(true)
                    
                }
                //.padding()
                .frame(width: UIScreen.main.bounds.width - 20, height: 200)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: Color("shadow"), radius: 25, x: 0, y: 0)
                .padding(12)
              //  .padding(5)
            
        }
    }
}

struct mainPage_Previews: PreviewProvider {
    static var previews: some View {
        mainPage()
    }
}
