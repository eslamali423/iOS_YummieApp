//
//  DishCategory.swift
//  Yummie
//
//  Created by Eslam Ali  on 07/04/2022.
//

import Foundation

struct DishCategory  {
    let id : String?
    let name : String?
    let image: String?
}

struct CategoryAPIResponse : Codable {
    
    let data : Type
}

struct Type : Codable {
    let categories : [Category]
    let populars : [Dish]
    let specials : [Dish]
}

struct Category : Codable {
    var id : String = ""
    var title : String = ""
    var image: String = ""
}

