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
    
    func testSuccessfulRequest() {
        let sampleResponse =
        """
            {
              "resultCount": 50,
              "results": [
                {
                  
                  "artistName": "Rock",
                  "trackName": "I Am Rock",
                  "trackViewUrl": "https://music.apple.com/us/album/i-am-rock/1233327608?i=1233328913&uo=4",
                  "artworkUrl100": "https://is5-ssl.mzstatic.com/image/thumb/Music117/v4/d8/fe/b2/d8feb259-1e17-4f18-e120-4c38557f6714/source/60x60bb.jpg",
                  "trackPrice": 1.29,
                  "releaseDate": "2005-09-06T12:00:00Z",
                  "trackTimeMillis": 230827,
                  "currency": "USD",
                }
              ]
            }
        """
        
        let responseData = sampleResponse.data(using: .utf8)!
        
        do {
            let response = try trackAPI.parseResponse(data: responseData)
            XCTAssertEqual(response.resultCount, 50)
            XCTAssertGreaterThan(response.results.count, 0)                        
                        
            XCTAssertEqual(response.results[0].artistName, "Rock")
            XCTAssertEqual(response.results[0].trackName, "I Am Rock")
            XCTAssertEqual(response.results[0].trackViewUrl, "https://music.apple.com/us/album/i-am-rock/1233327608?i=1233328913&uo=4")
            XCTAssertEqual(response.results[0].trackPrice, 1.29)
            XCTAssertEqual(response.results[0].releaseDate, "2005-09-06T12:00:00Z")
            XCTAssertEqual(response.results[0].trackTimeMillis, 230827)
            XCTAssertEqual(response.results[0].currency, "USD")
            XCTAssertEqual(response.results[0].artworkUrl100, "https://is5-ssl.mzstatic.com/image/thumb/Music117/v4/d8/fe/b2/d8feb259-1e17-4f18-e120-4c38557f6714/source/60x60bb.jpg")
        } catch let error as UnknownParseError {
            XCTAssertNotNil(error)
        } catch {
            XCTFail()
        }
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
