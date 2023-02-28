//
//  ChatH.swift
//  Crew
//
//  Created by asma abdilkreem on 04/08/1444 AH.
//

import SwiftUI

struct ChatH: View {
    @State private var searchText = ""
//    var dataArr = [["Sarah", "Nadine", "Alaa"], ["28/02", "20/02","15/02"], ["Thanks", "sure", "Bye"]]
    let names = ["Sarah", "Nadine", "Alaa"]
    var dates = ["28/02", "20/02","15/02"]
    var texts = ["Thanks", "sure", "Bye"]
    var body: some View {
//        NavigationStack {
        VStack{
            VStack {
                HStack { Spacer() }
                Spacer()
                HStack {
                    Text("Chat")
                        .font(.title)
                        .bold()
                    Spacer()
                }
//                .searchable(text: $searchText, prompt: "Search")
            }
            .frame(height: 30)
            .foregroundColor(.white)
            .padding(.horizontal, 5)
            .padding()
            .background(Color("darkgrey"))
        
            List{
                ForEach (0 ..< names.count){ i in
                  Chat(name: names[i], date: dates[i], text: texts[i])
                }
            }
            .listStyle(PlainListStyle())
//            .navigationTitle("Chats")
//            .navigationBarItems(trailing: Button(action: {}){
//                Image(systemName: "square.and.pencil")
//            })
//
                  
    
        }
    }
}

struct ChatH_Previews: PreviewProvider {
    static var previews: some View {
        ChatH()
    }
}
