//
//  RegisterView.swift
//  Crew
//
//  Created by Alaa Alabdullah on 26/02/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var vm = RegistrationViewModelImpl(service: RegistrationServiceImpl())
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 32.0) {
                
                VStack(spacing: 16.0) {
                    
                    InputTextFieldView(text: $vm.userDetails.name, placeholder: "Name", keyboardType: .namePhonePad, sfSymbol: nil)
                    
                    InputTextFieldView(text: $vm.userDetails.usid, placeholder: "Username", keyboardType: .namePhonePad, sfSymbol: nil)
                    
                    
                    InputTextFieldView(text: $vm.userDetails.email, placeholder: "Email", keyboardType: .emailAddress, sfSymbol: "envelope")
                    
                    InputPasswordView(password: $vm.userDetails.password, placeholder: "Password", sfSymbol: "lock")
                    
                    
                    
                    
                }
                ButtonView(title: "Sign up") {
                    vm.register()
                }
                
            }
            .padding(.horizontal, 15)
            .navigationTitle("Register")
            .applyClose()
            .alert(isPresented: $vm.hasError) {
                if case .failed(let error) = vm.state {
                    return Alert(title: Text("Error"), message: Text(error.localizedDescription))
                                 } else {
                        return Alert(title: Text("Error"), message: Text("something went wrong"))
                    }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
