//
//  TrackAPI.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

class TrackAPI: APIHandler {
    
    func makeRequest(with parameters: [String: Any]) -> Request {
        let url = Constants.URLS.trackAPIUrl
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        set(parameters, urlRequest: &urlRequest)
            
        let request = BaseRequest(urlRequest: urlRequest)
            
        return request
    }
    
    func parseResponse(data: Data) throws -> ResultModel {        
        return try defaultParseResponse(data: data)
    }

}
