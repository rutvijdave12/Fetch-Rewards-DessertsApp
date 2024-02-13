//
//  IngredientsView.swift
//  Desserts
//
//  Created by Rutvij Dave on 2/13/24.
//

import SwiftUI

struct IngredientsView: View {
    let ingredients: [Ingredient]
    
    var body: some View {
        HStack{
            Text("Ingredients")
                .frame(alignment: .leading)
                .font(.title)
                .padding()
            Spacer()
        }
        
        ForEach(ingredients, id: \.self) { ingredients in
            HStack{
                VStack(alignment: .leading, spacing: 5) {
                    Text(ingredients.name.capitalized)
                        .foregroundColor(.primary)
                        .font(.title2)
                    Text(ingredients.quantity)
                        .foregroundColor(.secondary)
                        .font(.title3)
                }
                .padding(.leading)
                .padding(.bottom)
                Spacer()
            }
        }
    }
}

#Preview {
    IngredientsView(ingredients: [Ingredient(name: "Milk", quantity: "1 Litre")])
}
