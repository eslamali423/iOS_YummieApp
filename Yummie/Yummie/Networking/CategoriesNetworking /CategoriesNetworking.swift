//
//  CategoriesNetworking.swift
//  Yummie
//
//  Created by Eslam Ali  on 14/04/2022.
//

import Foundation
import Alamofire

enum CategoriesNetworking {
    case getCategories
}


extension CategoriesNetworking : TargetType {
    var baseUrl: String {
        switch self {
        case .getCategories:
            return "https://yummie.glitch.me"
        }
    }
    
    var path: String {
        switch self {
        case .getCategories:
            return "/dish-categories"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCategories :
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getCategories :
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}

