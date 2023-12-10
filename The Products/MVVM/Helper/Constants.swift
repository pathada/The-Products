//
//  Constants.swift
//  The Products
//
//  Created by Padmaja Pathada on 5/12/23.
//

import Foundation
import UIKit

struct Constants {
    static let appBGColor = UIColor.init(red: 146/255, green: 144/255, blue: 0/255, alpha: 1)
    static let appTextColor = UIColor.init(red: 255/255, green: 252/255, blue: 121/255, alpha: 1)


}


struct ApiUrls {
    static let allProducts = "https://dummyjson.com/products"
    static let productCategories = "https://dummyjson.com/products/categories"
}

enum HTTPMethod: String {
case get = "GET"
case post = "POST"
}
