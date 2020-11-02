//
//  Commits.swift
//  GitHubAPI-Swift
//
//  Created by Stephen Kaylor on 11/1/20.
//  Copyright © 2020 Polian Shpatina. All rights reserved.
//

import Foundation

class CommitsResponse: Decodable {
    var sha : String?
    var nodeId : String?
    var commit : Commit?
    var url : String?
    var htmlUrl : String?
    var commentsUrl : String?
    var author : CommitAuthor?
    var committer : CommitCommiter?
    var parents : [CommitParents]?
    
    
    public enum CodingKeys: String, CodingKey{
        case sha
        case nodeId = "node_id"
        case commit
        case url
        case htmlUrl = "html_url"
        case commentsUrl = "comments_url"
        case author
        case committer
        case parents
    }
    
    required init(from decoder: Decoder) throws {

    let values = try decoder.container(keyedBy: CodingKeys.self)
  
    sha = try values.decodeIfPresent(String.self, forKey: .sha)
    nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
    commit = try values.decodeIfPresent(Commit.self, forKey: .commit)
    url = try values.decodeIfPresent(String.self, forKey: .url)
    htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
    commentsUrl = try values.decodeIfPresent(String.self, forKey: .commentsUrl)
    author = try values.decodeIfPresent(CommitAuthor.self, forKey: .author)
    committer = try values.decodeIfPresent(CommitCommiter.self, forKey: .committer)
    parents = try values.decodeIfPresent([CommitParents].self, forKey: .parents)
    }
}
