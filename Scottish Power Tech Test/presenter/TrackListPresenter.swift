//
//  TrackListPresenter.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

class TrackListPresenter: NSObject {

    private var delegate: TrackListDelegate
    private var tracks: [TrackViewModel] = [TrackViewModel]()
    private let trackApi = TrackAPI()
    
    /* Initialize the object with the delegate */
    init(delegate: TrackListDelegate) {
        self.delegate = delegate
    }
    
    /* Load tracks from backend */
    func loadTracks() {
        let apiLoader = APILoader(apiRequest: trackApi)
        apiLoader.loadAPIRequest(requestData: [:]) { (response, error) in
            if let results = response?.results {
                for track in results {
                    let trackViewModel = TrackViewModel(trackModel: track)
                    self.tracks.append(trackViewModel)
                }
                DispatchQueue.main.async {
                    self.delegate.showTracks(tracks: self.tracks)
                }
            }
        }
    }
    
}
