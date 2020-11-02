//
//  RepositoryPermission.swift
//  GitHubAPI-Swift
//
//  Created by Stephen Kaylor on 11/1/20.
//  Copyright © 2020 Polian Shpatina. All rights reserved.
//

import Foundation

class RepositoryPermission : Decodable {
    var admin : Bool?
    var pull : Bool?
    var push : Bool?

    enum CodingKeys: String, CodingKey {
        case admin
        case pull
        case push
    }
    
    required init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        admin = try values.decodeIfPresent(Bool.self, forKey: .admin)
        pull = try values.decodeIfPresent(Bool.self, forKey: .pull)
        push = try values.decodeIfPresent(Bool.self, forKey: .push)
    }
}
