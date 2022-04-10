//
//  DishListViewModel.swift
//  Yummie
//
//  Created by Eslam Ali  on 09/04/2022.
//

import Foundation

class DishListViewModel {
    
    var dishes : [Dish] = []
   
    func getDishes (categoryId : String, completion: @escaping (Bool)->Void ) {
        
        NetworkManager.shared.fetchCategoryDishs(categoryId: categoryId) { (result) in
            switch result {
            case .success(let dishes) :
                self.dishes = dishes
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
            
           
        
    }
    
}
