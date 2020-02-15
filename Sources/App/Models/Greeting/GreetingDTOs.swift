//
//  GreetingDTOs.swift
//  App
//
//  Created by Burcu Geneci on 17.01.2020.
//

import Vapor

struct GreetingRequest: Content{
    let language: String
}

struct GreetingResponse: Content{
    let message: String
}
