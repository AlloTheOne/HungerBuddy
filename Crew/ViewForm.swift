//
//  ViewForm.swift
//  Crew
//
//  Created by Dina Alhajj Ibrahim on 06/02/2023.
//
import SwiftUI

struct ViewForm: View {
    @State var cityName: String = ""
    var body: some View {
        VStack(alignment: .leading) {
                    Text("What App Are You Ordering From?")
                        .font(.headline)
            TextField("", text: $cityName, prompt: Text("App Name"))
              .padding()
              .background(
                RoundedRectangle(cornerRadius: 15)
                  .stroke(.gray)
              )
              .frame(height: 50)

                }

        
            
        }
    }

    
    struct ViewForm_Previews: PreviewProvider {
        static var previews: some View {
            ViewForm()
        }
    }

