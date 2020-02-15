//
//  RequestMiddleware.swift
//  App
//
//  Created by Burcu Geneci on 15.01.2020.
//

import Vapor

class RequestMiddleware: Middleware{
    
    func respond(to request: Request, chainingTo next: Responder) throws -> EventLoopFuture<Response> {
        return try next.respond(to: request)
    }
}
