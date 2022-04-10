//
//  ChefsSpecialsViewModel.swift
//  Yummie
//
//  Created by Eslam Ali  on 08/04/2022.
//

import Foundation


class ChefsSpecialsViewModel {
    
    var dishes : [Dish] = []
    
    func getChefSpecials (completion: @escaping (Bool)->Void) {
        
        NetworkManager.shared.fetchAllSpecials { (result) in
            
            switch result {
            case .success(let dishs):
                self.dishes = dishs
                completion(true)
                
            case .failure(let error) :
                completion(false)
                print(error.localizedDescription)
            }
        }
        
        
        
    }
}
