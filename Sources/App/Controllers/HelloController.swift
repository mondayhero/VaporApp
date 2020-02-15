//
//  HelloController.swift
//  App
//
//  Created by Burcu Geneci on 12.01.2020.
//

import Vapor

final class HelloController{
    
    fileprivate var service: IGreetingService
    
    init(service:IGreetingService) {
        self.service = service
    }
    
    func sayHello(_ req: Request) throws -> Future<GreetingResponse>{
        return try req.content.decode(GreetingRequest.self).flatMap({ inputRequest in
            return self.service.getMessage(request: req, inputRequest:inputRequest, type: .hello).map({ message in
                return GreetingResponse(message: message.text)
            })
        })
    }
}
