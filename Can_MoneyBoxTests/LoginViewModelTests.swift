//
//  Can_MoneyBoxTests.swift
//  Can_MoneyBoxTests
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import XCTest
@testable import Can_MoneyBox

class LoginViewModelTests: XCTestCase {
    
    var sut: LoginViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LoginViewModel(service: DefaultNetworkService())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testValidation()  {
        
        // given
        let result = sut.validateAndUpdateErrors(text: "test", type: .email)
        XCTAssertTrue(result)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
