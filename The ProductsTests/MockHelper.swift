//
//  MockHelper.swift
//  The ProductsTests
//
//  Created by Padmaja Pathada on 5/13/23.
//

import Foundation

enum MockFileName: String {
    case mock1 = "ProductListMock1"
    case mock2 = "ProductListMock2"
    case mock3 = "ProductListMock3"
    case mock4 = "ProductListMock4"
    case failure = "Something Wrong"


}

class MockHelper {
    static func getMockFileFromBundle<T: Codable>(mockName: String) -> T? {
        guard let fileURL = Bundle(for: The_ProductsTests.self).url(forResource: mockName, withExtension: "json"), let data = try? Data(contentsOf: fileURL), let content = try? JSONDecoder().decode(T.self, from: data) else { return nil }
        return content
    }
}
