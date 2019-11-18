//
//  Fact.swift
//  Catfacts
//
//  Created by Hadley Igoe on 2019-11-15.
//  Copyright © 2019 Hadley Igoe. All rights reserved.
//

import Foundation

struct CatFact: Codable {
    var all: [All]
}

struct All: Codable {
    var text: String
    var type: String
    var user: User?
}

struct User: Codable {
    var name: Name
}

struct Name: Codable {
    var first: String
    var last: String
    
    func fullName()-> String{
        return first + " " + last
    }
}
