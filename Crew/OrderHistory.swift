//
//  OrderHistory.swift
//  Crew
//
//  Created by Abeer on 18/07/1444 AH.
//

import SwiftUI

struct OrderHistory: View {
    var body: some View {
        
        VStack {
            VStack {
                HStack { Spacer() }
                Spacer()
                HStack {
                    Text("Order History")
                    
                        .font(.title)
                        .bold()
                    //Spacer()
                    
                }
            }
            .frame(height: 50)
            .foregroundColor(.white)
            .padding(.vertical)
            .background(Color("darkgrey"))
            .offset(x: 0, y: -100)
            VStack{
                HStack{
                    Text("McDonald's")
                        .padding(.leading)
                    Spacer()
                    Text("08:43")
                        .padding(.trailing, 10.0)
                    
                }
                VStack{
                    Text("Done")
                        .foregroundColor(Color.green)
                        .foregroundColor(Color.gray)
                        .padding(.trailing, 300.0)
                }
                Divider()
    
                VStack{
                    HStack{
                        Text("KFC")
                            .padding(.leading)
                        Spacer()
                        Text("Sun")
                            .padding(.trailing, 10.0)
                        
                    }
                    VStack{
                        Text("Done")
                            .foregroundColor(Color.green)
                            .foregroundColor(Color.gray)
                            .padding(.trailing, 300.0)
                    }
                    Divider()
                }
                VStack{
                    HStack{
                        Text("Burger king")
                            .padding(.leading)
                        Spacer()
                        Text("23 Mar")
                            .padding(.trailing, 10.0)
                        
                    }
                    VStack{
                        Text("Done")
                            .foregroundColor(Color.green)
                            .foregroundColor(Color.gray)
                            .padding(.trailing, 300.0)
                    }
                    Divider()
                }
                
                
            }
            .offset(x: 0, y: -90)
        }
                    .padding(.bottom, 300.0)

                    
                    


                
            
        }
    }


struct OrderHistory_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistory()
    }
}
