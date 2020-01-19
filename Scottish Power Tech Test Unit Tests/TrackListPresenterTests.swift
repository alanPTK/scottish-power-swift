//
//  TrackListPresenterTests.swift
//  Scottish Power Tech Test Unit Tests
//
//  Created by Alan Filipe Cardozo Fabeni on 18/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import XCTest
@testable import Scottish_Power_Tech_Test

class TrackListPresenterTests: XCTestCase {
    
    private var trackListViewController: TrackListSpy!
    private var trackListPresenter: TrackListPresenter!
    private var sampleTrack: TrackViewModel!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testTracksDisplay() {
        givenATrackListViewController()
        givenATrackListPresenter()
        givenASampleTrack()
        whenTheTracksAreLoaded()
        thenTheTrackListIsDisplayed()
        whenATrackIsSelected()
        thenTheDetailsAreDisplayed()
    }
    
    func givenATrackListViewController() {
        trackListViewController = TrackListSpy()
    }
    
    func givenATrackListPresenter() {
        trackListPresenter = TrackListPresenter(delegate: trackListViewController)
    }
    
    func givenASampleTrack() {
        sampleTrack = TrackViewModel(trackModel: TrackModel(trackName: "Flower of Scotland", artistName: "The Corries.", trackPrice: 2.99, artworkUrl100: "", releaseDate: "1965-01-01T12:00:00Z", trackTimeMillis: 1000, currency: "GBP", trackViewUrl: ""))
    }
    
    func whenTheTracksAreLoaded() {
        trackListPresenter.showTracks()
    }
    
    func thenTheTrackListIsDisplayed() {
        XCTAssertTrue(trackListViewController.showTracksHasBeenCalled)
    }
    
    func whenATrackIsSelected() {
        trackListPresenter.onSelect(selectedTrack: sampleTrack)
    }
    
    func thenTheDetailsAreDisplayed() {
        XCTAssertTrue(trackListViewController.showDetailForSelectedTrackHasBeenCalled)
    }

}
