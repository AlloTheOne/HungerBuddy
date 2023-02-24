
//
//  TotallyNewView.swift
//  PassData
//
//  Created by Abeer on 28/07/1444 AH.
//

import SwiftUI

struct TotallyNewView: View {
    @ObservedObject var blueFish: Whatever
    
    var body: some View {
        VStack{
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
            .offset(x: 0, y: -345)
            
            VStack (spacing: 0){
                
                Text(blueFish.someText)
                    .padding([.top, .leading])
                    .offset(x: 0 ,y: -330 )
                    .font(.title)
                    .frame(maxWidth: .infinity, maxHeight: 0, alignment: .leading)
                   // .multilineTextAlignment(.leading)

            }
            VStack{
                Divider()
                    .offset(x: 0 ,y: -250 )
            }
            VStack{
                Divider()
                    .offset(x: 0 ,y: -310 )
            }
            
        }
    }
}

struct TotallyNewView_Previews: PreviewProvider {
    static var previews: some View {
        
        TotallyNewView(blueFish: Whatever(someText: "Any text here"))

        
    }
    
}

