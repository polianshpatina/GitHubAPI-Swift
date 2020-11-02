//
//  CommitParents.swift
//  GitHubAPI-Swift
//
//  Created by Stephen Kaylor on 11/1/20.
//  Copyright © 2020 Polian Shpatina. All rights reserved.
//

import Foundation

class CommitParents : Decodable {
    
    var sha : String?
    var url : String?
    var htmlUrl : String?
    
    public enum CodingKeys: String, CodingKey{
        
        case sha
        case url
        case htmlUrl = "html_url"

    }
    
    required init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        sha = try values.decodeIfPresent(String.self, forKey: .sha)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
    }
}
