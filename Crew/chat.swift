//
//  chat.swift
//  Crew
//
//  Created by asma abdilkreem on 04/08/1444 AH.
//

import SwiftUI

struct Chat: View {
    @State var name = ""
    @State var date = ""
    @State var text = ""
    var body: some View {
        HStack(spacing: 20){
//            Image("chat1")
//                .resizable()
//                .frame(width:60,height: 60)
//                .clipShape(Circle())
            ZStack{
                VStack(alignment: .leading, spacing:5){
                    HStack{
                        Text(name)
                            .bold()
                        
                        Spacer()
                        Text(date)
                    }
                    HStack{
                        Text(text)
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
