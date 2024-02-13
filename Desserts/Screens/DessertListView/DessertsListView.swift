//
//  ContentView.swift
//  Desserts
//
//  Created by Rutvij Dave on 2/12/24.
//

import SwiftUI

struct DessertsListView: View {
    @StateObject var viewModel = DessertsListViewModel()
    
    var body: some View {
        ZStack{
            NavigationStack {
                List {
                    ForEach(viewModel.desserts, id: \.self) { dessert in
                        NavigationLink(destination: DessertDetailView(dessertId: dessert.idMeal, isShowingDetailView: $viewModel.isShowingDetailView)) {
                            DessertTitleView(dessert: dessert)
                        }
                    }
                }
                .navigationBarTitle("🍰 Desserts")
                .listStyle(PlainListStyle())
            }
            .accentColor(Color(.label))
            .onAppear {
                viewModel.getDesserts()
            }
            
//            Loading view if the data from API is not fetched yet
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
//        Alert view if some error like no internet or couldn't fetch data from API.

    }
    
}

#Preview {
    DessertsListView()
}
