//
//  DessertDetailViewModel.swift
//  Desserts
//
//  Created by Rutvij Dave on 2/12/24.
//

import SwiftUI

final class DessertsDetailViewModel: ObservableObject {
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    var dessertDetails: DessertDetails?
    @Published var mealDetails: MealDetails?
    
    func getDessertById(id: String){
        isLoading = true
        NetworkManager.shared.getDessertByID(id: id) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(var dessertDetails):
                    dessertDetails = dessertDetails.filter{
                        !$0.strMeal.isEmpty
                    }
                    self.dessertDetails = dessertDetails[0]
                    if let dessertDetails = self.dessertDetails {
                        var ingridients = [
                            Ingredient(name: dessertDetails.strIngredient1, quantity: dessertDetails.strMeasure1),
                            Ingredient(name: dessertDetails.strIngredient2, quantity: dessertDetails.strMeasure2),
                            Ingredient(name: dessertDetails.strIngredient3, quantity: dessertDetails.strMeasure3),
                            Ingredient(name: dessertDetails.strIngredient4, quantity: dessertDetails.strMeasure4),
                            Ingredient(name: dessertDetails.strIngredient5, quantity: dessertDetails.strMeasure5),
                            Ingredient(name: dessertDetails.strIngredient6, quantity: dessertDetails.strMeasure6),
                            Ingredient(name: dessertDetails.strIngredient7, quantity: dessertDetails.strMeasure7),
                            Ingredient(name: dessertDetails.strIngredient8, quantity: dessertDetails.strMeasure8),
                            Ingredient(name: dessertDetails.strIngredient9, quantity: dessertDetails.strMeasure9),
                            Ingredient(name: dessertDetails.strIngredient10, quantity: dessertDetails.strMeasure10),
                            Ingredient(name: dessertDetails.strIngredient11, quantity: dessertDetails.strMeasure11),
                            Ingredient(name: dessertDetails.strIngredient12, quantity: dessertDetails.strMeasure12),
                            Ingredient(name: dessertDetails.strIngredient13, quantity: dessertDetails.strMeasure13),
                            Ingredient(name: dessertDetails.strIngredient14, quantity: dessertDetails.strMeasure14),
                            Ingredient(name: dessertDetails.strIngredient15, quantity: dessertDetails.strMeasure15),
                            Ingredient(name: dessertDetails.strIngredient16 ?? "", quantity: dessertDetails.strMeasure16 ?? ""),
                            Ingredient(name: dessertDetails.strIngredient17 ?? "", quantity: dessertDetails.strMeasure17 ?? ""),
                            Ingredient(name: dessertDetails.strIngredient18 ?? "", quantity: dessertDetails.strMeasure18 ?? ""),
                            Ingredient(name: dessertDetails.strIngredient19 ?? "", quantity: dessertDetails.strMeasure19 ?? ""),
                            Ingredient(name: dessertDetails.strIngredient20 ?? "", quantity: dessertDetails.strMeasure20 ?? "")
                        ]
                        
                        ingridients = ingridients.filter { ingredient in
                            !ingredient.name.isEmpty
                        }
                        self.mealDetails = MealDetails(idMeal: dessertDetails.idMeal, strMeal: dessertDetails.strMeal, strMealThumb: dessertDetails.strMealThumb, strInstructions: dessertDetails.strInstructions, strYoutube: dessertDetails.strYoutube, ingredients: ingridients)
                    }
                    
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
