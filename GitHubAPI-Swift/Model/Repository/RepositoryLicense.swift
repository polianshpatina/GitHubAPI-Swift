//
//  RepositoryLicense.swift
//  GitHubAPI-Swift
//
//  Created by Stephen Kaylor on 11/1/20.
//  Copyright © 2020 Polian Shpatina. All rights reserved.
//

import Foundation

class RepositoryLicense : Decodable {
    var key : String?
    var name : String?
    var spdxId : String?
    var url : String?
    var nodeId : String?

    enum CodingKeys: String, CodingKey {
        case nodeId = "node_id"
        case key
        case name
        case spdxId = "spdx_id"
        case url
    }
    
    required init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        spdxId = try values.decodeIfPresent(String.self, forKey: .spdxId)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
}
