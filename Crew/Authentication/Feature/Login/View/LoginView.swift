//
//  LoginView.swift
//  Crew
//
//  Created by Alaa Alabdullah on 26/02/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    
    @StateObject private var vm = LoginViewModelImpl(service: LoginServiceImpl())
    
    var body: some View {
        VStack(spacing: 16.0) {
            
            VStack(spacing: 16.0) {
                InputTextFieldView(text: $vm.credentials.email, placeholder: "Email", keyboardType: .emailAddress, sfSymbol: "envelope")
                
                InputPasswordView(password: $vm.credentials.password, placeholder: "Password", sfSymbol: "lock")
            }
            HStack {
                Spacer()
                Button(action: {
                    showForgotPassword.toggle()
                }, label: {
                    Text("Forgot Password?")
                        .foregroundColor(Color(.black))
                })
                .font(.system(size: 16, weight: .bold))
                .sheet(isPresented: $showForgotPassword) {
                    ForgotPasswordView()
                }
            }
            
            VStack(spacing: 16.0) {
                ButtonView(title: "Login") {
                    vm.login()
                }
                
                ButtonView(title: "Register", background: .clear, foreground: Color("ouryellow"), border: Color("ouryellow")) {
                    showRegistration.toggle()
                }
                .sheet(isPresented: $showRegistration) {
                    RegisterView()
                }
            }
        }
            .padding(.horizontal, 15)
            .navigationTitle("Login")
            .alert(isPresented: $vm.hasError) {
                if case .failed(let error) = vm.state {
                    return Alert(title: Text("Error"), message: Text(error.localizedDescription))
                                 } else {
                        return Alert(title: Text("Error"), message: Text("something went wrong"))
                    }
            }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
