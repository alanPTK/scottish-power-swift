//
//  AppConstants.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

struct Constants {
    
    struct URLS {
        static let trackAPIUrl = URL(string: "https://itunes.apple.com/search?term=rock&media=music")!
    }
    
    struct CELLS {
        static let trackCellIdentifier = "trackCell"
    }
    
    struct STORYBOARDS {
        static let Main = "Main"
    }
    
    struct VIEWS {
        static let TrackList = "TrackList"
        static let TrackDetail = "TrackDetail"
        static let EmptyView = "EmptyView"        
    }
    
    struct SEGUES {
        static let SegueToTrackDetail = "segueToTrackDetail"        
    }
    
}

typealias APIHandler = RequestHandler & ResponseHandler
