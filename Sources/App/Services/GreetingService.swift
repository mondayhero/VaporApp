//
//  GreetingService.swift
//  App
//
//  Created by Burcu Geneci on 15.01.2020.
//

import Vapor

enum Languages: String{
    case en
    case tr
    case es
}
enum MessageTypes: String{
    case hello
    
    func getMessage(lang: Languages) -> Message{
        switch self {
        case .hello:
            return Message(type: self.rawValue, text: MessageTypes.getHelloMessage(lang: lang))
        }
    }
    
    static func getHelloMessage(lang: Languages)-> String{
        switch lang {
        case .en:
            return "Hello World! ♥️"
        case .tr:
            return "Merhaba Dünya! ♥️"
        case .es:
            return "Hola Munda! ♥️"
        }
    }
}
protocol IGreetingService{
    func getMessage(request: Request, inputRequest: GreetingRequest, type: MessageTypes)-> Future<Message>
}

struct GreetingService: IGreetingService {
    
    func getMessage(request: Request, inputRequest: GreetingRequest, type: MessageTypes) -> Future<Message>{
        let lang = Languages.init(rawValue: inputRequest.language) ?? Languages.en
        return request.future(type.getMessage(lang: lang))
    }
}
