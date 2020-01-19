//
//  Scottish_Power_Tech_Test_UI_Tests.swift
//  Scottish Power Tech Test UI Tests
//
//  Created by Alan Filipe Cardozo Fabeni on 19/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import XCTest

class Scottish_Power_Tech_Test_UI_Tests: XCTestCase {

    override func setUp() {
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
        
        continueAfterFailure = false
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testSelectTrack() {
        let app = XCUIApplication()
        
        //tap the first cell
        app.tables.staticTexts["Rock"].tap()
        
        //if the segue works as desired, then the next screen should have a button called 'More details'
        XCTAssertTrue(app.buttons["More details"].exists)
    }
    
    func testTouchMoreDetails() {
        let app = XCUIApplication()
        
        //tap the first cell of the table view
        app.tables.staticTexts["Rock"].tap()
        
        //tap the more details button
        app.buttons["More details"].tap()
        
        //if the button works as desired, then the app opens the browser and the More Details button is gone from the screen
        XCTAssertFalse(app.buttons["More details"].waitForExistence(timeout: 10))
    }
    
    func testGoBackToTracksScreen() {
        let app = XCUIApplication()
        
        //tap the first cell of the table view
        app.tables.staticTexts["Rock"].tap()
        
        //get back button from navigation bar
        let backButton = app.navigationBars["Scottish_Power_Tech_Test.TrackDetailView"].buttons["Back"]
        backButton.tap()
        
        //if the back button work as desired, then the screen should show 'Rock Tracks' as a title
        XCTAssertTrue(app.staticTexts["Rock Tracks"].exists)
    }
    
}
