//
//  TrackDetailViewController.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

class TrackDetailViewController: UIViewController {

    @IBOutlet weak var ivTrackCover: UIImageView!
    @IBOutlet weak var lbTrackName: UILabel!
    @IBOutlet weak var lbTrackArtist: UILabel!
    @IBOutlet weak var lbTrackPrice: UILabel!
    @IBOutlet weak var lbTrackReleaseDate: UILabel!
    @IBOutlet weak var lbTrackDuration: UILabel!
    
    var selectedTrack: TrackModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbTrackName.text = selectedTrack?.trackName
        lbTrackArtist.text = selectedTrack?.artistName
        lbTrackPrice.text = String("\(selectedTrack?.trackPrice)")
        lbTrackReleaseDate.text = selectedTrack?.releaseDate
        lbTrackDuration.text = String("\(selectedTrack?.trackTimeMillis)")
    }        

}
