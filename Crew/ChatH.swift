//
//  ChatH.swift
//  Crew
//
//  Created by asma abdilkreem on 04/08/1444 AH.
//

import SwiftUI

struct ChatH: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            List{
                ForEach (0 ..< 10){ i in 
                  Chat()
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Chats")
            .navigationBarItems(trailing: Button(action: {}){
                Image(systemName: "square.and.pencil")
            })
                          .navigationTitle("Chat")
                  .searchable(text: $searchText, prompt: "Search")
    
        }
    }
}

struct ChatH_Previews: PreviewProvider {
    static var previews: some View {
        ChatH()
    }
}
