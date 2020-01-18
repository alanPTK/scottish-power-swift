//
//  TrackListDelegate.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

protocol TrackListDelegate {

    /* Show the tracks fetched from the server */
    func showTracks(tracks: [TrackViewModel])
    
}
