//
//  NetworkManager.swift
//  Desserts
//
//  Created by Rutvij Dave on 2/12/24.
//

import Foundation
import SwiftUI

final class NetworkManager{
    static let shared = NetworkManager()
    
    static let baseURL = "https://themealdb.com/api/json/v1/1/"
    private let dessertsURL = baseURL + "filter.php?c=Dessert"
    private let dessertByIDURL = baseURL + "lookup.php?i="
    
    public init(){}
    
    func getDesserts(completed: @escaping (Result<[Dessert], DessertErrors>) -> Void) {
        guard let url = URL(string: dessertsURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else{
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(DessertResponse.self, from: data)
                completed(.success(decodedResponse.meals))
            }
            catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    func getDessertByID(id: String, completed: @escaping (Result<[DessertDetails], DessertErrors>) -> Void) {
        guard let url = URL(string: dessertByIDURL+id) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else{
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(DessertDetailsResponse.self, from: data)
                completed(.success(decodedResponse.meals))
            }
            catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
}
