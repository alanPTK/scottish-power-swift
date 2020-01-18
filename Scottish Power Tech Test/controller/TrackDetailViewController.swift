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
    @IBOutlet weak var btShowTrackDetails: UIButton!
    @IBOutlet weak var lbTrackReleaseDate: UILabel!
    @IBOutlet weak var lbTrackDuration: UILabel!
    
    var selectedTrack: TrackViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeViewStyle()
        
        loadSelectedTrackInformation()
    }
    
    func loadSelectedTrackInformation() {
        lbTrackName.text = selectedTrack.name
        lbTrackArtist.text = String(format: "%@ %@" , NSLocalizedString("from", comment: ""), selectedTrack.artist)
        lbTrackPrice.text = selectedTrack.price
        lbTrackReleaseDate.text = String(format: "%@ %@", NSLocalizedString("Released", comment: ""), selectedTrack.release)
        lbTrackDuration.text = String(format: "%@ %@", NSLocalizedString("Duration", comment: ""), selectedTrack.duration)
        ivTrackCover.loadImage(withUrl: selectedTrack.artwork)
    }
    
    func customizeViewStyle() {
        btShowTrackDetails.layer.borderWidth = 2.0
        btShowTrackDetails.layer.borderColor = UIColor.borderColor().cgColor
        btShowTrackDetails.layer.cornerRadius = 8.0
        btShowTrackDetails.setTitleColor(UIColor.informationColor(), for: .normal)
        view.backgroundColor = UIColor.backgroundColor()

        lbTrackName.textColor = .black
        lbTrackArtist.textColor = UIColor.informationColor()
        lbTrackPrice.textColor = UIColor.informationColor()
        lbTrackReleaseDate.textColor = UIColor.informationColor()
        lbTrackDuration.textColor = UIColor.informationColor()
    }        
        
    @IBAction func showTrackDetails(_ sender: Any) {
        showTrackDetails()
    }
    
    func showTrackDetails() {
        guard let trackUrl = selectedTrack?.url else {
            showSimpleAlert(title: NSLocalizedString("Attention", comment: ""), message: NSLocalizedString("Unable to load the track details.", comment: ""))

            return
        }

        guard let url = URL(string: trackUrl) else {
            showSimpleAlert(title: NSLocalizedString("Attention", comment: ""), message: NSLocalizedString("Unable to load the track details.", comment: ""))

            return
        }

        UIApplication.shared.open(url)
    }
        
}
