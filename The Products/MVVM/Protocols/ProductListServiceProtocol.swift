//
//  ProductListServiceProtocol.swift
//  The Products
//
//  Created by Padmaja Pathada on 5/13/23.
//

import Foundation

protocol ProductListServiceProtocol {
    typealias ProductsListResult = ((Result<ProductsListModel, Error>) -> Void)
    func getProductsList(completionHandler: @escaping ProductsListResult)
}
