//
//  ButtonView.swift
//  Crew
//
//  Created by Alaa Alabdullah on 26/02/2023.
//

import SwiftUI

struct ButtonView: View {
    
    
    typealias actionHandled = () -> Void
    
    let title: String
    let background: Color
    let foreground: Color
    let border: Color
    let handler: actionHandled
    
    private let cornerRadius: CGFloat = 10
    
    
    internal init(title: String,
                  background: Color = .blue,
                  foreground: Color = .white,
                  border: Color = .clear,
                  handler: @escaping ButtonView.actionHandled) {
        self.title = title
        self.background = background
        self.foreground = foreground
        self.border = border
        self.handler = handler
    }

    var body: some View {
        Button(action: handler, label: {
            Text(title)
                .frame(maxWidth: .infinity, minHeight: 50)
        })
        .background(background)
        .foregroundColor(foreground)
        .font(.system(size: 16, weight: .bold))
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(border, lineWidth: 2)
        )

    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonView(title: "Primary Button") { }
                .preview(with: "Primary Button")
            
            ButtonView(title: "Secondary Button", background: .clear, foreground: .blue, border: .blue) { }
                .preview(with: "Secondary Button")
        }
    }
}
