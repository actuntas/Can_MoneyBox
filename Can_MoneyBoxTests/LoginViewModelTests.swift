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
        sut = LoginViewModel(service: DefaultNetworkService(), request: LoginRequest())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testValidation()  {
        
        // given
        
        let email = "test"
        let password = "123dDerTyfds--"
        
        //when
        let emailInvalid = sut.validateAndUpdateErrors(text: email, type: .email)
        let passwordValid = sut.validateAndUpdateErrors(text: password, type: .password)
        
        
        
        //then
        XCTAssertFalse(emailInvalid)
        XCTAssertTrue(passwordValid)
        
    }

}
