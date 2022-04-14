//
//  PopularDishesAPI.swift
//  Yummie
//
//  Created by Eslam Ali  on 14/04/2022.
//

import Foundation
import Alamofire

class PopularDishesAPI : BaseAPI<PopularDishesNetwroking> {
    
    static let shared = PopularDishesAPI()
    
    
    func getPopularDishes(completion: @escaping (Result<CategoryAPIResponse?,NSError >)->Void){
        
        self.fetchData(target: .getPopularDishes, responseModel: CategoryAPIResponse.self) { (result) in
            completion(result)
        }
        
    }
    
}
