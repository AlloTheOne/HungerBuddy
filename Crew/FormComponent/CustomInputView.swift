//
//  CustomInputView.swift
//  Crew
//
//  Created by Alaa Alabdullah on 27/02/2023.
//

import SwiftUI

struct CustomInputView: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .foregroundColor(Color(.black))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.gray))
            .frame(height: 50)
            .padding()
    }
}

struct CustomInputView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputView(placeholder: "Restaurant Name", text: .constant("") )
    }
}
