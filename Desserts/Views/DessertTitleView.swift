//
//  DessertTitleView.swift
//  Desserts
//
//  Created by Rutvij Dave on 2/12/24.
//

import SwiftUI

struct DessertTitleView: View {
    let dessert: Dessert
    
    var body: some View{
        HStack{
            AsyncImage(url: URL(string: dessert.strMealThumb)) { image in
                image
                    .resizable()
                    .frame(width: 80, height: 80)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
            }
                .shadow(radius: 5)
            Text(dessert.strMeal)
                .font(.title3)
                .fontWeight(.semibold)
                .lineLimit(nil)
                .padding()
        }

    }
}

#Preview {
    DessertTitleView(dessert: MockData.meals.first!)
}
