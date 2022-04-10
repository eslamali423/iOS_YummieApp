//
//  Order.swift
//  Yummie
//
//  Created by Eslam Ali  on 09/04/2022.
//

import Foundation


struct OrdersAPIResponse : Codable{
    let data : [Order]
}


struct Order : Codable {
    let id : String?
    let name : String?
    let dish : Dish?
}
