//
//  SpacecraftItemViewModelTests.swift
//  ISROAppTests
//
//  Created by Rushikesh Lambe on 26/12/2021.
//

import XCTest
@testable import ISROApp

class SpacecraftItemViewModelTests: XCTestCase {
    
    // MARK: - Variables
    
    private var spacecraft: Spacecraft!
    private var spacecraftItemModel: SpacecraftItemViewModel!

    // MARK: - Unit TestCase Life Cycle Methods
    
    override func setUpWithError() throws {
        spacecraft = Spacecraft(id: 1, name: "Aryabhata")
        spacecraftItemModel = SpacecraftItemViewModel(spacecraft: spacecraft)
        try super.setUpWithError()
     }

    override func tearDownWithError() throws {
        spacecraft = nil
        spacecraftItemModel = nil
        try super.tearDownWithError()
    }

    // MARK: - Unit TestCases
    
    func testSpacecraftItemViewModel_map_showsDataInExpectedFormat() {
        XCTAssertEqual(spacecraftItemModel.spacecraftName, "Name: Aryabhata")
        XCTAssertNotEqual(spacecraftItemModel.spacecraftName, "Aryabhata")
        XCTAssertEqual(spacecraftItemModel.spacecraftId, "Id: 1")
        XCTAssertNotEqual(spacecraftItemModel.spacecraftId, "1")
    }

}
