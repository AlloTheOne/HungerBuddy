//
//  CloseModifier.swift
//  Crew
//
//  Created by Alaa Alabdullah on 26/02/2023.
//

import SwiftUI

struct CloseModifier: ViewModifier {
    
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })
            }
    }
    
}


extension View {
    
    func applyClose() -> some View {
        self.modifier(CloseModifier())
    }
}
