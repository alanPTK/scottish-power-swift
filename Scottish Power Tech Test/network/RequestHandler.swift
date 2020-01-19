//
//  RequestHandler.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 19/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import Foundation

protocol RequestHandler {
    associatedtype RequestDataType
    
    func makeRequest(with parameters: RequestDataType) -> Request
}

extension RequestHandler {
    
    /* Set the request data */
    func set(_ parameters: [String: Any], urlRequest: inout URLRequest) {
        if parameters.count != 0 {
            if let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
                urlRequest.httpBody = jsonData
            }
        }
    }
    
}
