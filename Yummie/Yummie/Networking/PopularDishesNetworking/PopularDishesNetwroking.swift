//
//  PopularDishesNetwroking.swift
//  Yummie
//
//  Created by Eslam Ali  on 14/04/2022.
//

import Foundation
import Alamofire


enum PopularDishesNetwroking {
    case getPopularDishes
}

extension PopularDishesNetwroking : TargetType {
    var baseUrl: String {
        switch self {
        case .getPopularDishes:
            return "https://yummie.glitch.me"
        }
    }
    
    var path: String {
        switch self {
        case .getPopularDishes:
            return "/dish-categories"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPopularDishes :
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getPopularDishes :
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
    
}
