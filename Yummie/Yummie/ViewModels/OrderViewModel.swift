//
//  OrderViewModel.swift
//  Yummie
//
//  Created by Eslam Ali  on 09/04/2022.
//

import Foundation

class OrderViewModel {
    
    var orders : [Order] = []
   
    func getOrders (completion: @escaping (Bool)->Void) {
        
        NetworkManager.shared.fetchAllOrders { (result) in
            switch result {
            case.success(let orders):
                self.orders = orders
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
 
    }
    
    func placeOrder (name :  String, dish : Dish, completion: @escaping (Bool)->Void) {
     completion(true)
    }
    
}
