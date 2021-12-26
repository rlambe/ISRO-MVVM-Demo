//
//  SpacecraftsViewModelTests.swift
//  ISROAppTests
//
//  Created by Rushikesh Lambe on 26/12/2021.
//

import XCTest
@testable import ISROApp

class SpacecraftsViewModelTests: XCTestCase {
    
    // MARK: - Variables
    
    private var subject: SpacecraftsViewModel!
    private var service: MockSpacecraftsService!
    private var viewModelDelegate: MockSpacecraftsViewModelDelegate!

    // MARK: - Unit TestCase Life Cycle Methods
    
    override func setUpWithError() throws {
        service = MockSpacecraftsService()
        viewModelDelegate = MockSpacecraftsViewModelDelegate()
        subject = SpacecraftsViewModel(service: service)
        subject.delegate = viewModelDelegate
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        service = nil
        viewModelDelegate = nil
        subject = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Unit TestCases
    
    func testSpacecraftViewModel_onAPICallSuccess_showsSpacecraftData() {
        // Given
        let spacecrafts = [
            Spacecraft(id: 1, name: "Aryabhata"),
            Spacecraft(id: 2, name: "Bhaskara-I")
        ]
        service.fetchMockSpacecrafts = .success(spacecrafts)
        
        // When
        subject.getSpacecrafts()
        
        // Then
        XCTAssertEqual(subject.itemViewModels.count, 2)
        XCTAssertEqual(subject.itemViewModels.first?.spacecraftName, "Name: Aryabhata")
        XCTAssertEqual(subject.itemViewModels[1].spacecraftId, "Id: 2")
        XCTAssertTrue(viewModelDelegate.isOnSuccessCalled)
        XCTAssertFalse(viewModelDelegate.isonFailure)
    }
    
    func testSpacecraftViewModel_onAPICallFailure_showsNoData() {
        // Given
        service.fetchMockSpacecrafts = .failure(NSError(domain: "Unknown", code: 0, userInfo: nil))
        
        // When
        subject.getSpacecrafts()
        
        // Then
        XCTAssertEqual(subject.itemViewModels.count, 0)
        XCTAssertFalse(viewModelDelegate.isOnSuccessCalled)
        XCTAssertTrue(viewModelDelegate.isonFailure)
    }

}

// Mock Classes
class MockSpacecraftsService: SpacecraftsServiceProtocol {
    
    var fetchMockSpacecrafts: Result<[Spacecraft], Error>?
    func getSpacecrafts(completion: @escaping (Result<[Spacecraft], Error>) -> Void) {
        if let result = fetchMockSpacecrafts {
            completion(result)
        }
    }
}


class MockSpacecraftsViewModelDelegate: SpacecraftsViewModelDelegate {
    private(set) var isOnSuccessCalled = false
    private(set) var isonFailure = false
    
    func onSucees() {
        isOnSuccessCalled = true
    }
    
    func onFailure(error: Error) {
        isonFailure = true
    }
    
    func reset() {
        isOnSuccessCalled = false
        isonFailure = false
    }
}


