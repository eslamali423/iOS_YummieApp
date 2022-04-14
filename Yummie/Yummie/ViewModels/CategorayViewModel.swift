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
        CategoriesAPI.shared.getCategories { (result) in
            DispatchQueue.main.async {
                switch result {
                
                case .success( let categories):
                    for newCategory in categories!.data.categories {
                        self.categories.append(newCategory)
                      //  print ("Name ::: \(self.categories[0].title)")
                    }
                    completion(true)
                case .failure(_):
                    print("Get Nothing")
                }
            }
         
        }
        
    }
    
}
