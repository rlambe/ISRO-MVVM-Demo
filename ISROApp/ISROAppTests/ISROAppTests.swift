//
//  ISROAppTests.swift
//  ISROAppTests
//
//  Created by Rushikesh Lambe on 26/12/2021.
//

import XCTest
@testable import ISROApp

class ISROAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCategories_OnLoad_shouldPopulateInExpectedOrder() {
        
        // Given, When
        let categories = CategoryService().getCategories()
        
        // Then
        XCTAssertEqual(categories.count, 3)
        XCTAssertEqual(categories.first?.name, "Spacecraft")
        XCTAssertEqual(categories[1].name, "Launchers")
        XCTAssertEqual(categories[2].name, "Centres")
    }

}
