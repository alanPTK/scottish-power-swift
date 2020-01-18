//
//  TrackTableViewCell.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbTrackName: UILabel!
    @IBOutlet weak var lbTrackArtist: UILabel!
    @IBOutlet weak var lbTrackPrice: UILabel!
    @IBOutlet weak var ivTrackCover: UIImageView!
    @IBOutlet weak var vContainer: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
          
        customizeCellStyle()
    }
    
    /* Customize the cell visual style */
    func customizeCellStyle() {
        vContainer.layer.borderColor = UIColor.borderColor().cgColor
        vContainer.layer.borderWidth = 2.0
        backgroundColor = UIColor.backgroundColor()
        
        lbTrackName.textColor = .black
        lbTrackArtist.textColor = UIColor.informationColor()
        lbTrackPrice.textColor = UIColor.informationColor()
    }
    
    /* Load the data into the cell */
    func loadTrackInformation(track: TrackViewModel) {
        lbTrackName.text = track.name
        lbTrackArtist.text = track.artist        
        lbTrackPrice.text = track.price
        ivTrackCover.loadImage(withUrl: track.artwork)
    }

}
