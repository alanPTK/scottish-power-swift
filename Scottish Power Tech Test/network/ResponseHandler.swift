//
//  ResponseHandler.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 19/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import Foundation

protocol ResponseHandler {
    associatedtype ResponseDataType
    
    func parseResponse(data: Data) throws -> ResponseDataType
}

extension ResponseHandler {
    
    /* Parse the response into the model */
    func defaultParseResponse<T: Response>(data: Data) throws -> T {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        if let body = try? jsonDecoder.decode(T.self, from: data) {
            return body
        } else {
            throw UnknownParseError()
        }
    }
    
}

protocol Response: Codable {}
