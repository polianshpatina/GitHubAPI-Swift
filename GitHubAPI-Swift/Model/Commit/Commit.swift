//
//  Commit.swift
//  GitHubAPI-Swift
//
//  Created by Stephen Kaylor on 11/1/20.
//  Copyright © 2020 Polian Shpatina. All rights reserved.
//

import Foundation

class Commit : Decodable {
    
    var author : Author?
    var commiter : Commiter?
    var message : String?
    var tree : Tree?
    var url : String?
    var commentCount : Int?
    var verification : Verification?


    public enum CodingKeys: String, CodingKey{
        
        case author
        case commiter
        case message
        case tree
        case url
        case commentCount = "commit_count"
        case verification
 

    }
    
    required init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)

        author = try values.decodeIfPresent(Author.self, forKey: .author)
        commiter = try values.decodeIfPresent(Commiter.self, forKey: .commiter)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        tree = try values.decodeIfPresent(Tree.self, forKey: .tree)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        commentCount = try values.decodeIfPresent(Int.self, forKey: .commentCount)
        verification = try values.decodeIfPresent(Verification.self, forKey: .verification)
    }
}

class Author : Decodable {
    
    var name : String?
    var email : String?
    var date : String?
    
    public enum CodingKeys: String, CodingKey{
        
        case name
        case email
        case date

    }
    
    required init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        date = try values.decodeIfPresent(String.self, forKey: .date)
    }
}

class Commiter : Decodable {
    
    var name : String?
    var email : String?
    var date : String?
    
    public enum CodingKeys: String, CodingKey{
        
        case name
        case email
        case date

    }
    
    required init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        date = try values.decodeIfPresent(String.self, forKey: .date)
    }
}

class Tree : Decodable {
    
    var sha : String?
    var url : String?
    
    public enum CodingKeys: String, CodingKey{
        
        case sha
        case url
    }
    
    required init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        sha = try values.decodeIfPresent(String.self, forKey: .sha)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
}

class Verification : Decodable {
    
    var verified : Bool?
    var reason : String?
    var signiture : String?
    var payload : String?
    
    public enum CodingKeys: String, CodingKey{
        
        case verified
        case reason
        case signiture
        case payload
    }
    
    required init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        verified = try values.decodeIfPresent(Bool.self, forKey: .verified)
        reason = try values.decodeIfPresent(String.self, forKey: .reason)
        signiture = try values.decodeIfPresent(String.self, forKey: .signiture)
        payload = try values.decodeIfPresent(String.self, forKey: .payload)
    }
}
