//
//  myOrderCard.swift
//  Crew
//
//  Created by Alaa Alabdullah on 07/02/2023.
//

import SwiftUI

struct myOrderCard: View {
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
                    Image(systemName: "person.3.sequence")
                    Text("3-4")
                        .font(.caption)
                    
                }
                .padding(.bottom, 5)
                HStack{
                    Image(systemName: "arrow.up.forward.app")
                    Text("Jahez")
                        .font(.caption)
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Join")
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: 200)
                            .frame(height: 40)
                            .background(Color("ouryellow"))
                            .cornerRadius(10)
                        
                    }
                    
                }
//                .padding(.bottom)
                
               

            }
                .padding()
                .frame(width: 360, height: 150)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: Color("shadow"), radius: 25, x: 0, y: 0)
                .padding()
        }
    }
}

struct myOrderCard_Previews: PreviewProvider {
    static var previews: some View {
        myOrderCard()
    }
}
