//
//  TrackListPresenter.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

class TrackListPresenter: NSObject {

    private lazy var tracks: [TrackViewModel] = [TrackViewModel]()
    private var delegate: TrackListDelegate
    private let trackApi = TrackAPI()
    
    /* Initialize the object with the delegate */
    init(delegate: TrackListDelegate) {
        self.delegate = delegate
    }
    
    /* Load tracks from server */
    func loadTracks() {
        delegate.showLoadingMessage(message: NSLocalizedString("Loading tracks...", comment: ""))
        
        let apiLoader = APILoader(apiRequest: trackApi)
        apiLoader.loadAPIRequest(requestData: [:]) { (response, error) in
            if let results = response?.results {
                for track in results {
                    let trackViewModel = TrackViewModel(trackModel: track)
                    self.tracks.append(trackViewModel)
                }
                DispatchQueue.main.async {
                    self.showTracks()
                }
            }
        }
    }
    
    func showTracks() {
        delegate.hideLoadingMessage()
        delegate.showTracks(tracks: self.tracks)
    }
    
    /* When a track is selected on the view, process the information and ask for the details */
    func onSelect(selectedTrack track: TrackViewModel) {
        delegate.showDetailFor(selectedTrack: track)
    }
    
}
