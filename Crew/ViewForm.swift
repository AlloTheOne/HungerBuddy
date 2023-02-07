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
        VStack {
            Text("New Order")
                .foregroundColor(.white)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black.ignoresSafeArea(edges: .top))
                .frame(maxWidth: .infinity)
            Spacer()
            
        }
       
    }
    
    struct ViewForm_Previews: PreviewProvider {
        static var previews: some View {
            ViewForm()
        }
    }
}
