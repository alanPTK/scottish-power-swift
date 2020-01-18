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
        return String("\(Utils.shared.symbolForCurrency(currency: self.trackModel.currency)) \(Utils.shared.formatPrice(price: self.trackModel.trackPrice))")
    }
    
    public var duration: String {
        return String(self.trackModel.trackTimeMillis)
    }
    
    public var release: String {
        return self.trackModel.releaseDate
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
