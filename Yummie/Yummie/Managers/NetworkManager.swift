//
//  NetworkManager.swift
//  Yummie
//
//  Created by Eslam Ali  on 10/04/2022.
//

import Foundation

class NetworkManager {
    
    static let shared =  NetworkManager()
    
    struct Constants {
        static let baseUrl = "https://yummie.glitch.me"
        static let allCategoriesUrl = "/dish-categories"
        static let categoryDishs = "/dishes/"
        static let OredersUrl = "/orders/"
     //   https://yummie.glitch.me/dish-categories
       // https://yummie.glitch.me/dishes/cat1
    }
    
    //MARK:- Fetch All Categories
    func fetchAllCategories (completion : @escaping (Result<[Category], Error>)->Void){
        
        guard let url =  URL(string: "\(Constants.baseUrl)\(Constants.allCategoriesUrl)") else {return}
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else  {return}
            
            do {
                let result = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(result.data.categories))
             //   print("Resulttt :::: \(result.data.categories)")
            }catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
        task.resume()
        
        
    }
    
    //MARK:- Fetch All Categories
    func fetchAllPopularDishs (completion : @escaping (Result<[Dish], Error>)->Void){
        
        guard let url =  URL(string: "\(Constants.baseUrl)\(Constants.allCategoriesUrl)") else {return}
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else  {return}
            
            do {
                let result = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(result.data.populars))
             //   print("Resulttt :::: \(result.data.categories)")
            }catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
        task.resume()
   
    }
    
    //MARK:- Fetch All Categories
    func fetchAllSpecials (completion : @escaping (Result<[Dish], Error>)->Void){
        
        guard let url =  URL(string: "\(Constants.baseUrl)\(Constants.allCategoriesUrl)") else {return}
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else  {return}
            
            do {
                let result = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(result.data.specials))
             //   print("Resulttt :::: \(result.data.categories)")
            }catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
        task.resume()
        
        
    }
    //MARK:- Fetch ALl Dishs In Catigories with Category Id
    func fetchCategoryDishs (categoryId : String, completion : @escaping (Result<[Dish], Error>)->Void) {
        
        guard let url = URL(string: "\(Constants.baseUrl)\(Constants.categoryDishs)\(categoryId)") else {
           
            return
        }
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) {data,_,error  in
            
            guard let data =  data , error == nil else {return}
            
            do {
                let result = try JSONDecoder().decode(CategoryDishResponse.self, from: data)
                completion(.success(result.data))
            }catch {
                
            }
       
        }
        task.resume()
 
    }
    //MARK:- Fetch Orders
    func fetchAllOrders (completion : @escaping (Result<[Order], Error>)->Void) {
        
        guard let url = URL(string: "\(Constants.baseUrl)\(Constants.OredersUrl)") else {
           
            return
        }
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) {data,_,error  in
            
            guard let data =  data , error == nil else {
              
                return}
            
            do {
                let result = try JSONDecoder().decode(OrdersAPIResponse.self, from: data)
               
                completion(.success(result.data))
            }catch {
                
            }
       
        }
        task.resume()
    }
    
    //MARK:- Place Order
    
    func requestOrder(name : String ,dish: Dish , completion: @escaping (Result<Bool, Error>) -> Void
      ) {
        guard let url = URL(string: "\(Constants.baseUrl)\(Constants.OredersUrl)\(dish.id!)") else {
                 print("Cant get the url")
            return}
        let params = [
            "name" : name,
            "id" : dish.id
     
        ]
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
        urlRequest.httpBody = bodyData

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                
            guard let data = data , error == nil else {
                completion(.failure(error!))
                return}
            
            completion(.success(true))
                   
                   
                  
               }.resume()
        
    }
  
    
    
    
  
    
    
}
