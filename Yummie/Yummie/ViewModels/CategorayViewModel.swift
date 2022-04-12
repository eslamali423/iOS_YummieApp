//
//  CategorayViewModel.swift
//  Yummie
//
//  Created by Eslam Ali  on 07/04/2022.
//

import Foundation

class CategorayViewModel {
    
    var categories : [Category] = []
    
    
    func getCategories (completion: @escaping (Bool)->Void) {
        
        NetworkManager.shared.fetchAllCategories { (result) in
            
            switch result {
            case .success(let categories):
                self.categories = categories
                completion(true)
               
            case .failure(let error) :
                completion(false)
                print(error.localizedDescription)
            }
        }
        
    }
    
    func fetchCategory(completion: @escaping (Bool)->Void){
        NetworkManager.shared.fetchData(url: NetworkManager.Constants.categoiesUrl, responseModel: CategoryAPIResponse.self) { (categoryResult) in
           
            switch categoryResult {
            case .success(let categories):
                self.categories = categories.data.categories
                completion(true)
               
            case .failure(let error) :
                completion(false)
                print(error.localizedDescription)
            }
            
            
        }
        
        
    }
    
}
