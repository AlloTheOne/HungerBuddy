//
//  formH.swift
//  Crew
//
//  Created by Abeer on 01/08/1444 AH.
//

import SwiftUI

struct formH: View {
    @State var cityName: String = ""
    @StateObject var pinkFish = Whatever(someText: "")
    
    @State var restaurantName = " "
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                VStack {
                   // HStack { Spacer() }
                    //Spacer()
                    HStack{
                        HStack {
                            Text("New Order")
                            
                                .font(.title)
                                .bold()
                            // Spacer()
//                            NavigationLink("􀤏") {
//                                TotallyNewView(blueFish: pinkFish)
//                                    .padding(.leading, -190.0)
////                                VStack{
////
////                                }
//                            }
                            
                        }
                        // Spacer()
                        HStack (spacing: 150){
                            NavigationLink("􀤏L")
                            {TotallyNewView(blueFish: pinkFish)
                                    .padding([.top, .leading], -18.0)
                                VStack{
                                    VStack{
                                        
                                    }
                                    
                                }
                                
                                .padding(.leading, 10.0)
                                //Divider()
                            }
                        }

                    }
                    .frame(height: 50)
                    .frame(width: 500)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("darkgrey"))
                    // .ignoresSafeArea()
                    
                    
                    TextField("Restaurant Name", text: $pinkFish.someText)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray))
                        .frame(height: 50)
                        .padding()
                    ViewForm()
                        .padding()
                    // Spacer()
                    // .padding()
                    
                    TextField("", text: $cityName, prompt: Text("Delivery Fee"))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray))
                        .frame(height: 50)
                        .padding()
                    SwiftUIView5()
                        .padding()
                    //Spacer()
                    TextField("", text: $cityName, prompt: Text("Add Notes and comments"))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.gray))
                        .frame(height: 50)
                        .padding()
                    Spacer()
                    
                    //                NavigationLink("􀤏") {
                    //                    TotallyNewView(blueFish: pinkFish)
                    //                        .padding(.leading, -190.0)
                    //                    VStack{
                    //
                    //                    }
                    
                    //  Divider()
                    //.padding(.leading, 100.0)
                }
                Button {

                } label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 250, height: 250)
                        .frame(height: 40)
                        .background(Color("ouryellow"))
                        .cornerRadius(10)

                }
                
                Spacer()
                    .padding()
            }
            
        }
        
    }
    
}
    
    
    
    struct formH_Previews: PreviewProvider {
        static var previews: some View {
            formH()
        }
    }

