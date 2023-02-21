//
//  TotallyNewView.swift
//  Crew
//
//  Created by Abeer on 01/08/1444 AH.
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
            
            VStack{
                
                Text(blueFish.someText)
                
            }
          
        }
    }
}

struct TotallyNewView_Previews: PreviewProvider {
    static var previews: some View {
        TotallyNewView(blueFish: Whatever(someText: "Any text here"))
    }
}

