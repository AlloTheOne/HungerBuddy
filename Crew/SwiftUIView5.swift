//
//  SwiftUIView5.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 08/02/2023.
//

import SwiftUI

struct SwiftUIView5: View {
    @State private var checked = true
    @State var cityName: String = ""
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("How Can People Pay You?")
                    .font(.headline)
                TextField("", text: $cityName, prompt: Text("Payment...."))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray)
                    )
                    .frame(height: 50)
                HStack {
                    CheckBoxView(checked: $checked)
                   // Spacer()
                    Text("Save For Next Order")
                }

            }
            
            
            
        }
    }
    
    struct SwiftUIView5_Previews: PreviewProvider {
        static var previews: some View {
            SwiftUIView5()
        }
    }
}
