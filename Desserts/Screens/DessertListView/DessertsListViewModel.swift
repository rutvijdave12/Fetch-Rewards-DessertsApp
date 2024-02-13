//
//  DessertsListViewModel.swift
//  Desserts
//
//  Created by Rutvij Dave on 2/12/24.
//

import SwiftUI

final class DessertsListViewModel: ObservableObject {
    var selectedDessert: Dessert? {
        didSet {
            isShowingDetailView = true
        }
    }
    @Published var isShowingDetailView = false
    @Published var desserts: [Dessert] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false

    
    func getDesserts(){
        isLoading = true
        NetworkManager.shared.getDesserts { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let desserts):
                    self.desserts = desserts.filter{
                        !$0.strMeal.isEmpty
                    }
                    .sorted(by: { d1, d2 in
                        d1.strMeal.lowercased() < d2.strMeal.lowercased()
                    })
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
