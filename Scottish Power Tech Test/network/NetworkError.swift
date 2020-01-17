//
//  NetworkError.swift
//  Scottish Power Tech Test
//
//  Created by Alan Filipe Cardozo Fabeni on 17/01/20.
//  Copyright © 2020 Alan Filipe Cardozo Fabeni. All rights reserved.
//

struct NetworkError: Error {
    let message: String
}

struct UnknownParseError: Error { }

struct ServiceError: Error, Codable {
    let httpStatus: Int
    let message: String
    let description: String    
}
