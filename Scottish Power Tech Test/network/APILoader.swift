//
//  APILoader.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import UIKit

class APILoader<T: APIHandler> {
    
    let apiRequest: T
    let urlSession: URLSession
    
    /* Initialize the loader with the selected request and the session */
    init(apiRequest: T, urlSession: URLSession = .shared) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
    }
    
    /* Load the information from server with the request parameters */
    func loadAPIRequest(requestData: T.RequestDataType, completionHandler: @escaping (T.ResponseDataType?, Error?) -> ()) {
        let urlRequest = apiRequest.makeRequest(with: requestData).urlRequest
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
