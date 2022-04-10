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
                print(self.categories[1].title)
            case .failure(let error) :
                completion(false)
                print(error.localizedDescription)
            }
        }
        
        
        
        
        
//        categories =  [.init(id: "123", name: "category 1", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png"),
//                       .init(id: "123", name: "category 2", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png"),
//                       .init(id: "123", name: "category 3", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png"),
//                       .init(id: "123", name: "category 4", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png"),
//                       .init(id: "123", name: "category 5", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png")
//                       
//                   ]

        
    }
    
}
