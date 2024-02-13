//
//  DetailedImageView.swift
//  Desserts
//
//  Created by Rutvij Dave on 2/13/24.
//

import SwiftUI

struct DetailedImageView: View {
    let imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    .cornerRadius(10)
                    .padding()
                    
                    }
                placeholder: {
                    LoadingView()
            }
    }
}

#Preview {
    DetailedImageView(imageURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
}
