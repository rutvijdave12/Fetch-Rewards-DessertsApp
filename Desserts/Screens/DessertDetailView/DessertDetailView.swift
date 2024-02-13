//
//  DessertDetailView.swift
//  Desserts
//
//  Created by Rutvij Dave on 2/12/24.
//

import SwiftUI

struct DessertDetailView: View {
    let dessertId: String
    @StateObject var detailsViewModel = DessertsDetailViewModel()
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        ZStack{
            VStack{
                NavigationStack{
                        ScrollView{
//                            All the views will only be loaded together if the data has been fetched from the API.
                            if !detailsViewModel.isLoading {
//                            Refactored each view separately into its own views.
                                DetailedImageView(imageURL: detailsViewModel.mealDetails?.strMealThumb ?? "")
                                
                                DetailedInstructionView(instructions: detailsViewModel.mealDetails?.strInstructions ?? "")
                                
                                IngredientsView(ingredients: detailsViewModel.mealDetails?.ingredients ?? [])
                                
                                Button {
                                    isShowingSafariView = true
                                } label: {
                                    ButtonView(title: "Watch on YouTube")
                                }
                                .padding()
                            }
                            
                        }
                        .navigationTitle(detailsViewModel.mealDetails?.strMeal ?? "")
                        .listStyle(PlainListStyle())
                        .onAppear {
                            detailsViewModel.getDessertById(id: dessertId)
                        }
                        
                }
                        
            }
            .fullScreenCover(isPresented: $isShowingSafariView) {
                SafariView(url: (URL(string: detailsViewModel.mealDetails?.strYoutube ?? "") ?? URL(string: ""))!)
            }
            
//            Loading view if the data from API is not fetched yet
            if detailsViewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $detailsViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        //        Alert view if some error like no internet or couldn't fetch data from API.
    }
}

#Preview {
    DessertDetailView(dessertId: MockData.meals.first?.idMeal ?? "", isShowingDetailView: .constant(false))
}
