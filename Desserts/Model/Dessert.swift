//
//  Dessert.swift
//  Desserts
//
//  Created by Rutvij Dave on 2/12/24.
//

import Foundation

struct Dessert: Codable, Hashable{
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}

struct DessertResponse: Codable {
    let meals: [Dessert]
}


struct MockData {
    static let meals = [
        Dessert(idMeal: "53049", strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Dessert(idMeal: "52850", strMeal: "Apple & Blackberry Crumble", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
        Dessert(idMeal: "52751", strMeal: "Apple Frangipan Tart", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
        Dessert(idMeal: "53052", strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Dessert(idMeal: "52853", strMeal: "Apple & Blackberry Crumble", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
        Dessert(idMeal: "52754", strMeal: "Apple Frangipan Tart", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
        Dessert(idMeal: "53055", strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Dessert(idMeal: "52856", strMeal: "Apple & Blackberry Crumble", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
        Dessert(idMeal: "52757", strMeal: "Apple Frangipan Tart", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
        Dessert(idMeal: "53058", strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        Dessert(idMeal: "52859", strMeal: "Apple & Blackberry Crumble", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
        Dessert(idMeal: "52760", strMeal: "Apple Frangipan Tart", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
      ]
    
}
