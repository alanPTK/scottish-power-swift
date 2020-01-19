//
//  UtilTests.swift
//  Scottish Power Tech Test Unit Tests
//
//  Created by Alan Filipe Cardozo Fabeni on 18/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import XCTest
@testable import Scottish_Power_Tech_Test

class UtilTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCurrencySymbol() {
        let currency = "USD"
        let expectedOutput = "$"
        let result = Utils.symbolForCurrency(currency: currency)
                
        XCTAssertTrue(result == expectedOutput)
    }
    
    func testDateFormatting() {
        let rawDate = "2010-06-18T12:00:00Z"
        let expectedOutput = "18 Jun, 2010"
        let result = Utils.formatDate(date: rawDate, formatFrom: "yyyy-MM-dd'T'HH:mm:ss'Z'", formatTo: "d MMM, yyyy")
                
        XCTAssertTrue(result == expectedOutput)
    }
    
    func testSecondsFormatting() {
        let seconds = 356067 / 1000
        let expectedOutput = (0, 5, 56)
        let result = Utils.formatSeconds(seconds: seconds)
        
        XCTAssertTrue(result == expectedOutput)
    }
    
    func testPriceFormatting() {
        let price = 1.39
        let expectedOutput = "1,39"
        let result = Utils.formatPrice(price: price)
        
        XCTAssertTrue(result == expectedOutput)
    }

}
