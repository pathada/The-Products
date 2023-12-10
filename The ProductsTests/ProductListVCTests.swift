//
//  ProductListVCTests.swift
//  The ProductsTests
//
//  Created by Padmaja Pathada on 5/13/23.
//

import XCTest
@testable import The_Products

final class ProductListVCTests: XCTestCase {
    
    var vc: ProductsListVC!

    override func setUp() {
        super.setUp()
        vc = ProductsListVC.navigateToProductsListPage(service: MockProductListService(type: .mock4))

    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
   vc = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testProductListSuccess() throws {
       // vc.productVM.resetProductsList()
        XCTAssertEqual(vc.productVM.productsList.count, 0)
        XCTAssertEqual(vc.productVM.productsList.count, vc.tableView(vc.tableView, numberOfRowsInSection: 0))
        vc.viewWillAppear(false)
        XCTAssertGreaterThan(vc.productVM.productsList.count, 0)
        XCTAssertEqual(vc.productVM.productsList.count, 30)
        XCTAssertEqual(vc.productVM.productsList.count, vc.tableView(vc.tableView, numberOfRowsInSection: vc.productVM.productsList.count))
        
    }

}


class MockProductListService: ProductListServiceProtocol {
    let mockType: MockFileName
    init(type: MockFileName) {
        mockType = type
    }
    func getProductsList(completionHandler: @escaping ProductsListResult) {
        switch mockType {
        case .mock1:
            if let result: ProductsListModel = MockHelper.getMockFileFromBundle(mockName: MockFileName.mock1.rawValue) {
                completionHandler(.success(result))
            } else {
                print("mock1 error")
            }
        case .mock2:
            if let result: ProductsListModel = MockHelper.getMockFileFromBundle(mockName: MockFileName.mock2.rawValue) {
                completionHandler(.success(result))
            } else {
                print("mock2 error")

            }
        case .mock3:
            if let result: ProductsListModel = MockHelper.getMockFileFromBundle(mockName: MockFileName.mock3.rawValue) {
                completionHandler(.success(result))
            } else {
                print("mock3 error")

            }
        case .mock4:
            if let result: ProductsListModel = MockHelper.getMockFileFromBundle(mockName: MockFileName.mock4.rawValue) {
                completionHandler(.success(result))
            } else {
                print("mock4 error")
            }
        case .failure:
            print(" failed ")
        }
        
    }
}

