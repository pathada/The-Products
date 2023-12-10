//
//  ProductListService.swift
//  The Products
//
//  Created by Padmaja Pathada on 5/13/23.
//

import Foundation

class ProductListService: ProductListServiceProtocol {
    func getProductsList(completionHandler: @escaping ProductsListResult) {
        guard let url = URL(string: ApiUrls.allProducts) else {
            completionHandler(.failure(Error.self as! Error))
            return
        }
       // ServiceManager.shared.ApiManager(url: url, httpMethod: HTTPMethod.get, bodyData: nil, completionHandler: completionHandler)
        
        ApiManager(url: url, httpMethod: HTTPMethod.get, bodyData: nil, completionHandler: completionHandler)
    }
    
    func ApiManager<T: Codable>(url: URL, httpMethod: HTTPMethod, bodyData: Data?, completionHandler: @escaping (Result<T, Error>) -> Void)
    {
        
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        if let bodyData = bodyData{
            request.httpBody = bodyData
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                
                if let error = error {
                    completionHandler(.failure(error))
                    return
                }
                guard let data = data else {
                    // completionHandler(.failure(error ?? Error))
                    print(data ?? Data())
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(T.self, from: data)
                    completionHandler(.success(decodedData))
                } catch {
                    // completionHandler(.failure(error ?? Error))
                    print("catch error \(String(describing: error)) ")
                    
                }
                
            }
            
        }.resume()
            
        }
    
}
