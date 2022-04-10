//
//  PopularDishesViewModel.swift
//  Yummie
//
//  Created by Eslam Ali  on 08/04/2022.
//

import Foundation


class PopularDishesViewModel {
    
    var dishs : [Dish] = []
    
    func getPopularDishs (completion: @escaping (Bool)->Void) {
        
        NetworkManager.shared.fetchAllPopularDishs { (result) in
            
            switch result {
            case .success(let dishs):
                self.dishs = dishs
                completion(true)
                
            case .failure(let error) :
                completion(false)
                print(error.localizedDescription)
            }
        }
        
        
        
    }
}
