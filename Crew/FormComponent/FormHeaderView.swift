//
//  FormHeaderView.swift
//  Crew
//
//  Created by Alaa Alabdullah on 27/02/2023.
//

import SwiftUI

struct FormHeaderView: View {
    var body: some View {
        VStack {
            HStack { Spacer() }
            Spacer()
            HStack {
                Text("New Order")
                    .font(.title)
                    .bold()
            }
        }
        .frame(height: 50)
        .foregroundColor(.white)
        .padding()
        .background(Color("darkgrey"))
    }
}

struct FormHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FormHeaderView()
    }
}
