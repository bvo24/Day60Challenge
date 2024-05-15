//
//  User.swift
//  Day60Challenge
//
//  Created by Brian Vo on 5/14/24.
//

import Foundation


struct Friend : Codable, Identifiable, Hashable{
    var id : UUID
    var name : String
    
}

struct User : Codable, Identifiable, Hashable{
    
    var id : UUID
    var isActive : Bool
    var name : String
    var age : Int
    var email : String
    var address : String
    var about : String
    var registered : Date
    var tags : [String]
    var friends : [Friend]
    
}

//struct Users : Codable{
//    
//    var results : [User]
//    
//}
