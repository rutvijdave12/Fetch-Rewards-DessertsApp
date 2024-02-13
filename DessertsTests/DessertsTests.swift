//
//  DessertsTests.swift
//  DessertsTests
//
//  Created by Rutvij Dave on 2/12/24.
//

import XCTest
@testable import Desserts
import Foundation

final class DessertsTests: XCTestCase {
    func testGetDessertsNotNil(){
        let networkManagerInstance = NetworkManager()
        networkManagerInstance.getDesserts { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetDessertsByCorrectIDNotNil(){
        let networkManagerInstance = NetworkManager()
        let expectation = XCTestExpectation(description: "Network request completed")
        networkManagerInstance.getDessertByID(id: "53049") { result in
            XCTAssertNotNil(result)
            expectation.fulfill()
            
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testGetDessertsByWrongIDNotNil(){
        let networkManagerInstance = NetworkManager()
        networkManagerInstance.getDessertByID(id: "1234") { result in
            XCTAssertNotNil(result)
        }
    }
    
    func testGetDessertsByCorrectID(){
        let networkManagerInstance = NetworkManager()
        let expectation = XCTestExpectation(description: "Network request completed")
        networkManagerInstance.getDessertByID(id: "53049") { result in
            switch result {
            case .success(let dessertDetails):
                XCTAssertEqual(dessertDetails[0].idMeal, "53049")
            case .failure(let error):
                XCTAssertTrue(error is Error)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
}
