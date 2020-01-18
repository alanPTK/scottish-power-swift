//
//  ResponseModel.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

struct ResultModel: Response {
    var resultCount: Int
    var results: [TrackModel]
}

struct TrackModel: Response {
    var trackName: String
    var artistName: String
    var trackPrice: Double
    var artworkUrl30: String
    var artworkUrl60: String
    var artworkUrl100: String
    var releaseDate: String
    var trackTimeMillis: Int
    var currency: String
}
