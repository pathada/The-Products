//
//  ProductsListModel.swift
//  The Products
//
//  Created by Padmaja Pathada on 5/12/23.
//

import Foundation

struct ProductsListModel: Codable {
    
    let products: [ProductInfo?]
    
}

struct ProductInfo: Codable {
    
    let title: String?
    let description: String?
    let price: Int?
    let thumbnail: String?
    //let images: [String?]
    
}

