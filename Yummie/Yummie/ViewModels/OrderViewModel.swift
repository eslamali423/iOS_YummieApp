//
//  OrderViewModel.swift
//  Yummie
//
//  Created by Eslam Ali  on 09/04/2022.
//

import Foundation

class OrderViewModel {
    
    var orders : [Order] = []
   
    func getOrders () {
        
        orders =  [
            .init(id: "123", name: "order 1", dish: .init(id: "123", name: "Dish 6", discription: "best dish ever", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png" , calories: 175)),
            
            .init(id: "123", name: "order 2", dish: .init(id: "123", name: "Dish 6", discription: "best dish ever", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png" , calories: 175)),
            
            .init(id: "123", name: "order 3", dish: .init(id: "123", name: "Dish 6", discription: "best dish ever", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png" , calories: 175)),
            
            .init(id: "123", name: "order 4", dish: .init(id: "123", name: "Dish 6", discription: "best dish ever", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png" , calories: 175)),
            
            
           
        
            
                       
                   ]

        
    }
    
    
    
}
