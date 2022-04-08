//
//  PopularDishesViewModel.swift
//  Yummie
//
//  Created by Eslam Ali  on 08/04/2022.
//

import Foundation


class PopularDishesViewModel {
    
    var dishes : [Dish] = []
   
    func getDishes () {
        
        dishes =  [
            
            .init(id: "123", name: "Dish 1", discription: "   best dish ever", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png" , calories: 123),
            .init(id: "123", name: "Dish 2", discription: "best dish ever", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png" , calories: 175),
            .init(id: "123", name: "Dish 3", discription: "best dish ever", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png" , calories: 175),
            .init(id: "123", name: "Dish 4", discription: "best dish ever", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png" , calories: 175),
            .init(id: "123", name: "Dish 5", discription: "best dish ever", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png" , calories: 175),
            .init(id: "123", name: "Dish 6", discription: "best dish ever", image: "https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png" , calories: 175),
            
                       
                   ]

        
    }
    
}
