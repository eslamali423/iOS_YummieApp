//
//  NetworkManager.swift
//  Yummie
//
//  Created by Eslam Ali  on 10/04/2022.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared =  NetworkManager()
    
    struct Constants {
        static let baseUrl = "https://yummie.glitch.me"
        static let allCategoriesUrl = "/dish-categories"
        static let categoryDishs = "/dishes/"
        static let OredersUrl = "/orders/"
        static let categoiesUrl = "\(baseUrl)\(allCategoriesUrl)"
     //   https://yummie.glitch.me/dish-categories
       // https://yummie.glitch.me/dishes/cat1
    }
    
    //MARK:- Fetch All Categories
    func fetchAllCategories (completion : @escaping (Result<[Category], Error>)->Void){
        
        guard let url =  URL(string: "\(Constants.baseUrl)\(Constants.allCategoriesUrl)") else {return}
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else  {return}
            
            do {
                let result = try JSONDecoder().decode(CategoryAPIResponse.self, from: data)
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
                let result = try JSONDecoder().decode(CategoryAPIResponse.self, from: data)
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
                let result = try JSONDecoder().decode(CategoryAPIResponse.self, from: data)
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
                
            guard  (data != nil) , error == nil else {
                completion(.failure(error!))
                return}
            
            completion(.success(true))
                   
                   
                  
               }.resume()
        
    }
    
    
    //MARK:- fetch data with alamofire and generics
    func fetchData<T: Codable> (url : String, responseModel: T.Type, completion: @escaping (Result<T, Error>)->Void) {
        AF.request(url, method: .get, parameters: [:], headers: [:]).responseDecodable(of: T.self) { (response) in
            guard let statusCode = response.response?.statusCode else  {return }
            
            if statusCode == 200 { // success
                
                guard let jsonResponse = try? response.result.get() else {return}
                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {return}
                guard let result = try? JSONDecoder().decode(T.self, from: jsonData) else {return}
                completion(.success(result))
            }
        }
        
    }
  
    
    
    
  
    
    
}
