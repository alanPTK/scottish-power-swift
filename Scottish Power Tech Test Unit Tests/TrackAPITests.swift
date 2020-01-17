//
//  TrackAPITests.swift
//  Scottish Power Tech Test Unit Tests
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import XCTest
@testable import Scottish_Power_Tech_Test

class TrackAPITests: XCTestCase {
    
    let trackAPI = TrackAPI()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testMakeRequest() {
        let urlRequest = trackAPI.makeRequest(with: [:]).urlRequest
        
        XCTAssertEqual(urlRequest.httpMethod, "GET")
        XCTAssertNil(urlRequest.httpBody)
        XCTAssertEqual(urlRequest.url?.absoluteString, Constants.URLS.trackAPIUrl.absoluteString)
        XCTAssertNotNil(urlRequest.allHTTPHeaderFields)
        XCTAssertLessThanOrEqual(urlRequest.allHTTPHeaderFields!.count, 1)
    }
    
    func testUnknownError() {
        let sampleResponse =
        """
        {
            "error"
        }
        """
        let responseData = sampleResponse.data(using: .utf8)!
        
        do {
            let _ = try trackAPI.parseResponse(data: responseData)
            XCTFail()
        } catch let error as UnknownParseError {
            XCTAssertNotNil(error)
        } catch {
            XCTFail()
        }
    }

}
