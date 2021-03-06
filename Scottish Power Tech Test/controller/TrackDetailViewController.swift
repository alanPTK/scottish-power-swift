//
//  TrackDetailViewController.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit
import SafariServices

class TrackDetailViewController: UIViewController, SFSafariViewControllerDelegate {

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
    
    /* Load the selected track information */
    func loadSelectedTrackInformation() {
        lbTrackName.text = selectedTrack.name
        lbTrackArtist.text = String(format: "%@ %@" , NSLocalizedString("from", comment: ""), selectedTrack.artist)
        lbTrackPrice.text = selectedTrack.price
        lbTrackDuration.text = String(format: "%@ %@", NSLocalizedString("Duration", comment: ""), selectedTrack.duration)
        lbTrackReleaseDate.text = String(format: "%@ %@", NSLocalizedString("Released", comment: ""), selectedTrack.release)
        ivTrackCover.loadImage(withUrl: selectedTrack.artwork)
    }
    
    /* Customize the view visual style */
    func customizeViewStyle() {
        btShowTrackDetails.backgroundColor = UIColor.institutionalGreenColor()
        btShowTrackDetails.setTitleColor(.white, for: .normal)
        btShowTrackDetails.layer.cornerRadius = 8.0
        btShowTrackDetails.setTitle(NSLocalizedString("More details", comment: ""), for: .normal)
        
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
    
    /* Check if the url is valid and open the track information on browser */
    func showTrackDetails() {
        guard let trackUrl = selectedTrack?.url else {
            showSimpleAlert(title: NSLocalizedString("Attention", comment: ""), message: NSLocalizedString("Unable to load the track details.", comment: ""))

            return
        }

        guard let url = URL(string: trackUrl) else {
            showSimpleAlert(title: NSLocalizedString("Attention", comment: ""), message: NSLocalizedString("Unable to load the track details.", comment: ""))

            return
        }
        
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = self

        present(safariViewController, animated: true)
        
        //UIApplication.shared.open(url)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
        
}
