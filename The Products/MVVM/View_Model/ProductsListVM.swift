//
//  ProductsListVM.swift
//  The Products
//
//  Created by Padmaja Pathada on 5/12/23.
//

import Foundation

class ProductsListVM {
    
    let service: ProductListServiceProtocol
    weak var delegate: BehaviourProtocol?
    var productsList: [ProductInfo] = [] {
        didSet {
            delegate?.success()
        }
    }
    
    init(service: ProductListServiceProtocol) {
        self.service = service
    }
    func resetProductsList() {
        productsList = []
    }
    func getProductsList() {
        
        service.getProductsList {[weak self] (result: Result<ProductsListModel, Error>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let productResult):
                self.productsList = productResult.products.compactMap{ $0 }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
