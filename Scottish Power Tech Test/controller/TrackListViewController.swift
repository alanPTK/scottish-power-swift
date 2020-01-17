//
//  TrackListViewController.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

class TrackListViewController: UIViewController {

    @IBOutlet weak var tvTracks: UITableView!
    
    private var presenter: TrackListPresenter?
    private var tracks: [TrackModel] = [TrackModel]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initObjects()
        
        customizeViewStyle()
    }
    
    /* Initialize the objects used by the view controller */
    func initObjects() {
        presenter = TrackListPresenter(delegate: self)
        presenter?.loadTracks()
    }
    
    /* Customize the view visual style */
    func customizeViewStyle() {
        view.backgroundColor = UIColor.backgroundColor()
        tvTracks.separatorColor = .clear        
    }

}

extension TrackListViewController: TrackListDelegate {
    
    /* Reload the table view with the fetched tracks */
    func showTracks(tracks: [TrackModel]) {
        self.tracks = tracks
        tvTracks.reloadData()
    }
    
}

extension TrackListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trackCell = tableView.dequeueReusableCell(withIdentifier: Constants.CELLS.trackCellIdentifier, for: indexPath) as! TrackTableViewCell
        let track = tracks[indexPath.row]
        trackCell.loadTrackInformation(track: track)                
        
        return trackCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTrack = tracks[indexPath.row]
        print(selectedTrack.trackName)
    }

}
