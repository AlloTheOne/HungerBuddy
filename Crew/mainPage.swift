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
        VStack(spacing: 0){
            VStack {
                HStack { Spacer() }
                Spacer()
                HStack {
                    Text("New Order")
                    
                        .font(.title)
                        .bold()
                   // Spacer()
                    
                }
            }
            .frame(height: 50)
            .foregroundColor(.white)
            .padding()
            .background(Color("darkgrey"))
       // .ignoresSafeArea()
            
         
                TextField("", text: $cityName, prompt: Text("Restaurant Name"))
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

    
    
    
    struct mainPage_Previews: PreviewProvider {
        static var previews: some View {
            mainPage()
        }
    }

