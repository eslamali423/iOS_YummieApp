//
//  CategoriesAPI.swift
//  Yummie
//
//  Created by Eslam Ali  on 14/04/2022.
//

import Foundation


class CategoriesAPI : BaseAPI<CategoriesNetworking> {
    
    static let shared = CategoriesAPI()
    
    
    func getCategories (completion: @escaping (Result<CategoryAPIResponse?, NSError>)->Void) {
        
        self.fetchData(target: .getCategories, responseModel: CategoryAPIResponse.self) { (result) in
            
            completion(result)
        }
        
    }
    
}
