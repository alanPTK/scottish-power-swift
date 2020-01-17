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
        
        vContainer.layer.borderColor = UIColor.borderColor().cgColor
        vContainer.layer.borderWidth = 2.0
        vContainer.backgroundColor = .white
        backgroundColor = UIColor.backgroundColor()
    }

}
