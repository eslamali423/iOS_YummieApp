//
//  Dish.swift
//  Yummie
//
//  Created by Eslam Ali  on 08/04/2022.
//

import Foundation


struct CategoryDishResponse : Codable {
    let data : [Dish]
}


struct Dish :Codable  {
    let id : String?
    let name : String?
    let description : String?
    let image: String?
    let calories : Int?
    
    var formattedCalories : String {
        return String(format: "\(calories ?? 0) Calories" )
    }
}
