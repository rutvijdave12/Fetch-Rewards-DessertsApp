//
//  ButtonView.swift
//  Desserts
//
//  Created by Rutvij Dave on 2/12/24.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .font(.title2)
            .fontWeight(.semibold)
            .background(.red)
            .foregroundColor(.black)
            .cornerRadius(10)

    }
}

#Preview {
    ButtonView(title: "Test Text")
}
