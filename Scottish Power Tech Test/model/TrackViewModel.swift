//
//  TrackViewModel.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 18/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

class TrackViewModel: NSObject {

    let trackModel: TrackModel
    
    init(trackModel: TrackModel) {
        self.trackModel = trackModel
    }

}

extension TrackViewModel {
    
    public var name: String {
        return self.trackModel.trackName
    }
    
    public var artist: String {
        return self.trackModel.artistName
    }
    
    public var price: String {
        return String("\(Utils.symbolForCurrency(currency: self.trackModel.currency)) \(Utils.formatPrice(price: self.trackModel.trackPrice))")
    }
    
    public var duration: String {
        let (hours, minutes, seconds) = Utils.formatSeconds(seconds: self.trackModel.trackTimeMillis / 1000)
        
        if minutes != 0 {
            return "\(minutes):\(seconds)"
        }
        
        if hours != 0 {
            return "\(hours):\(minutes):\(seconds)"
        }
        
        return String(self.trackModel.trackTimeMillis)
    }
    
    public var release: String {
        return Utils.formatDate(date: self.trackModel.releaseDate, formatFrom: "yyyy-MM-dd'T'HH:mm:ss'Z'", formatTo: "d MMM, yyyy")
    }
    
    public var currency: String {
        return self.trackModel.currency
    }
    
    public var artwork: String {
        return self.trackModel.artworkUrl100
    }
    
    public var url: String {
        return self.trackModel.trackViewUrl
    }
    
}
