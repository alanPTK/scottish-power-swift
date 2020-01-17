//
//  BaseRequest.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

import Foundation

protocol Request {
    var urlRequest: URLRequest { get }
}

class BaseRequest: Request {
    
    private var request: URLRequest
    
    init(urlRequest: URLRequest) {
        self.request = urlRequest
    }
    
    var urlRequest: URLRequest {
        self.request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
    }
    
}
