//
//  chat.swift
//  Crew
//
//  Created by asma abdilkreem on 04/08/1444 AH.
//

import SwiftUI

struct Chat: View {
    var body: some View {
        HStack(spacing: 20){
            Image("chat1")
                .resizable()
                .frame(width:60,height: 60)
                .clipShape(Circle())
            ZStack{
                VStack(alignment: .leading, spacing:5){
                    HStack{
                        Text("Nadine")
                            .bold()
                        
                        Spacer()
                        Text("11/25/2022")
                    }
                    HStack{
                        Text("Hello")
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height:50, alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 40)
                        
                    }
                }
            }
        }
    }
    struct Chat_Previews: PreviewProvider {
        static var previews: some View {
            Chat()
        }
    }
    
}
