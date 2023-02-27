//
//  headerView.swift
//  Crew
//
//  Created by Alaa Alabdullah on 06/02/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import Combine

struct headerView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    @State var showForm = false
    var body: some View {
        VStack(spacing: 0){
            VStack {
                HStack { Spacer() }
                Spacer()
                HStack {
                    Text("Hello \(sessionService.userDetails?.name ?? " ")")
                        .font(.title)
                        .bold()
                    Spacer()
                    Button {
                        showForm = true
                    } label: {
                        Text("+")
                            .font(.title)
                            .bold()
                    }
                    .fullScreenCover(isPresented: $showForm) {
                        FORM()
                    }
                    
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
