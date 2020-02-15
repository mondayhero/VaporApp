//
//  Message.swift
//  App
//
//  Created by Burcu Geneci on 17.01.2020.
//

import Vapor

struct Message: Content{
//    let _id: ObjectId
    let type: String
    let text: String
}
