//
//  APILoader.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

class APILoader<T: APIHandler > {
    
    let apiRequest: T
    let urlSession: URLSession
    let reachability: Reachability
    
    init(apiRequest: T, urlSession: URLSession = .shared, reachability: Reachability = Reachability()!) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
        self.reachability = reachability
    }
    
    func loadAPIRequest(requestData: T.RequestDataType, completionHandler: @escaping (T.ResponseDataType?, Error?) -> ()) {
        if reachability.connection == .none {
            return completionHandler(nil, NetworkError(message: "No internet connection"))
        }
        
        let urlRequest = apiRequest.makeRequest(from: requestData).urlRequest
        urlSession.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return completionHandler(nil, error) }
            
            do {
                let parsedResponse = try self.apiRequest.parseResponse(data: data)
                return completionHandler(parsedResponse, nil)
            } catch {
                return completionHandler(nil, error)
            }
        }.resume()
    }
    
}
