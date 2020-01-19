//
//  TrackListSpy.swift
//  Scottish Power Tech Test Unit Tests
//
//  Created by Alan Filipe Cardozo Fabeni on 18/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit
@testable import Scottish_Power_Tech_Test

class TrackListSpy: TrackListDelegate {
    
    private(set) var showTracksHasBeenCalled = false
    private(set) var showDetailForSelectedTrackHasBeenCalled = false
    
    func showTracks(tracks: [TrackViewModel]) {
        showTracksHasBeenCalled = true
    }
    
    func showDetailFor(selectedTrack track: TrackViewModel) {
        showDetailForSelectedTrackHasBeenCalled = true
    }
                
}
