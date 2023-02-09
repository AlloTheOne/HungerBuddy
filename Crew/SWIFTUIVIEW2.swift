//
//  SWIFTUIVIEW2.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 09/02/2023.
//

import SwiftUI

struct SwiftUIView2: View {
    @State var cityName: String = ""
    @State private var checked = true
    var body: some View {
        
       
            
            VStack {
                Text("How Can People Pay You?")
                    .font(.headline)
                TextField("", text: $cityName, prompt: Text("Payment..."))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray)
                    )
                    .frame(maxWidth: .infinity)
                
                
            }
        }
        
    
    
        struct SwiftUIView2_Previews: PreviewProvider {
            static var previews: some View {
                SwiftUIView2()
            }
        }
    }
