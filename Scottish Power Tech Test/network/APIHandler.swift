//
//  APIHandler.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import Foundation

protocol RequestHandler {
    associatedtype RequestDataType
    
    func makeRequest(with parameters: RequestDataType) -> Request
}

protocol ResponseHandler {
    associatedtype ResponseDataType
    
    func parseResponse(data: Data) throws -> ResponseDataType
}

typealias APIHandler = RequestHandler & ResponseHandler

protocol Response: Codable {}

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

extension ResponseHandler {
    
    /* Parse the response into the model */
    func defaultParseResponse<T: Response>(data: Data) throws -> T {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        if let body = try? jsonDecoder.decode(T.self, from: data) {
            return body
        } else if let errorResponse = try? jsonDecoder.decode(ServiceError.self, from: data) {
            throw errorResponse
        } else {
            throw UnknownParseError()
        }
    }
    
}
