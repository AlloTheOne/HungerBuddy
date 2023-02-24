//
//  FORM.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 09/02/2023.
//


import SwiftUI

struct FORM: View {
    @State var cityName: String = ""
    @StateObject var pinkFish = Whatever(someText: "")

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

    
    
    
    struct FORM_Previews: PreviewProvider {
        static var previews: some View {
           FORM()
        }
    }

