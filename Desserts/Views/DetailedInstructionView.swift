//
//  DetailedInstructionView.swift
//  Desserts
//
//  Created by Rutvij Dave on 2/13/24.
//

import SwiftUI

struct DetailedInstructionView: View {
    let instructions: String
    
    var body: some View {
        HStack{
            Text("Instructions")
                .alignmentGuide(.leading) { d in d[.leading] }
                .frame(alignment: .leading)
                .font(.title)
                .padding()
            Spacer()
        }
        
        Text(instructions)
            .padding()
            .font(.body) 
    }
}

#Preview {
    DetailedInstructionView(instructions: "testing")
}
