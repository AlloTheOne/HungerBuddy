//
//  login.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 19/02/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
//            Image("your-logo")
//                .resizable()
//                .frame(width: 100, height: 100)
            
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(.bottom, 20)
            
            Button(action: {
                // Handle the login action here.
            }) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            
            Spacer()
        }
        .padding()
    }
}


struct login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
