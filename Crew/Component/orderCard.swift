//
//  orderCard.swift
//  Crew
//
//  Created by Alaa Alabdullah on 06/02/2023.
//

import SwiftUI

struct orderCard: View {
    var body: some View {
        VStack {
            VStack{
                HStack{
                    Text("McDonald's")
                        .bold()
                    Spacer()
                    Text("4 min")
                        .font(.caption)
                    
                }
                .padding(.bottom)
                HStack{
                    Text("20 SAR")
                        .font(.caption)
                    Spacer()
                    Text("6 per one")
                        .font(.caption)
                    
                }
                .padding(.bottom)
                HStack{
                    Text("STC Pay")
                        .font(.caption)
                    Spacer()
                    Text("6.2")
                        .font(.caption)
                    
                }
                .padding(.bottom)
                HStack{
                    Text("Jahez")
                        .font(.caption)
                    Spacer()
                    Text("3-4")
                        .font(.caption)
                    
                }
                .padding(.bottom)
                
                Button {
                    
                } label: {
                    Text("Join")
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color("ouryellow"))
                        .cornerRadius(10)
                    
                }

            }
                .padding()
                .frame(width: 250, height: 215)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: Color("shadow"), radius: 30, x: 0, y: 0)
        }
    }
}

struct orderCard_Previews: PreviewProvider {
    static var previews: some View {
        orderCard()
    }
}
