//
//  headerView.swift
//  Crew
//
//  Created by Alaa Alabdullah on 06/02/2023.
//

import SwiftUI

struct headerView: View {
    var body: some View {
        VStack(spacing: 0){
            VStack {
                HStack { Spacer() }
                Spacer()
                HStack {
                    Text("Hello Abeer")
                        .font(.title)
                        .bold()
                    Spacer()
                    Text("+")
                        .font(.title)
                        .bold()
                }
            }
            .frame(height: 80)
            .foregroundColor(.white)
            .padding()
            .background(Color("darkgrey"))
            .ignoresSafeArea()
//            Spacer()
        }
        
    }
}

struct headerView_Previews: PreviewProvider {
    static var previews: some View {
        headerView()
    }
}
