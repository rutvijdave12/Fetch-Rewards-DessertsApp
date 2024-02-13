//
//  LoadingView.swift
//  Desserts
//
//  Created by Rutvij Dave on 2/12/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .opacity(0.9)
                .ignoresSafeArea(.all)
            
            ProgressView()
                .scaleEffect(2)
                
        }
    }
}

#Preview {
    LoadingView()
}
