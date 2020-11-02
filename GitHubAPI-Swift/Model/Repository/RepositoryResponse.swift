//
//  Repository.swift
//  GitHubAPI-Swift
//
//  Created by Stephen Kaylor on 11/1/20.
//  Copyright © 2020 Polian Shpatina. All rights reserved.
//

import Foundation

class RepositoryResponse : Decodable {
    
    var id : Int?
    var nodeId : String?
    var name : String?
    var fullName : String?
    var privateField : Bool?
    var owner : RepositoryOwner?
    var permissions : RepositoryPermission?
    var htmlUrl : String?
    var descriptionField : String?
    var fork : Bool?
    var url : String?
    var forksUrl : String?
    var keysUrl : String?
    var collaboratorsUrl : String?
    var teamsUrl : String?
    var hooksUrl : String?
    var issueEventsUrl : String?
    var eventsUrl : String?
    var assigneesUrl : String?
    var branchesUrl : String?
    var tagsUrl : String?
    var blobsUrl : String?
    var gitTagsUrl : String?
    var gitRefsUrl : String?
    var treesUrl : String?
    var statusesUrl : String?
    var languagesUrl : String?
    var stargazersUrl : String?
    var contributorsUrl : String?
    var subscribersUrl : String?
    var subscriptionUrl : String?
    var commitsUrl : String?
    var gitCommitsUrl : String?
    var commentsUrl : String?
    var issueCommentUrl : String?
    var contentsUrl : String?
    var compareUrl : String?
    var mergesUrl : String?
    var archiveUrl : String?
    var downloadsUrl : String?
    var issuesUrl : String?
    var pullsUrl : String?
    var milestonesUrl : String?
    var notificationsUrl : String?
    var labelsUrl : String?
    var releasesUrl : String?
    var deploymentsUrl : String?
    var createdAt : String?
    var updatedAt : String?
    var pushedAt : String?
    var gitUrl : String?
    var sshUrl : String?
    var cloneUrl : String?
    var svnUrl : String?
    var homepage : String?
    var size : Int?
    var stargazersCount : Int?
    var watchersCount : Int?
    var language : String?
    var hasIssues : Bool?
    var hasProjects : Bool?
    var hasDownloads : Bool?
    var hasWiki : Bool?
    var hasPages : Bool?
    var forksCount : Int?
    var mirrorUrl : String?
    var archived : Bool?
    var disabled : Bool?
    var openIssuesCount : Int?
    var license : String?
    var forks : Int?
    var openIssues : Int?
    var watchers : Int?
    var defaultBranch : String?
    

    enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case name
        case fullName = "full_name"
        case privateField = "private"
        case owner
        case permissions
        case htmlUrl = "html_url"
        case descriptionField = "description"
        case fork
        case url
        case forksUrl = "forks_url"
        case keysUrl = "keys_url"
        case collaboratorsUrl = "collaborators_url"
        case teamsUrl = "teams_url"
        case hooksUrl = "hooks_url"
        case issueEventsUrl = "issue_events_url"
        case eventsUrl = "events_url"
        case assigneesUrl = "assignees_url"
        case branchesUrl = "branches_url"
        case tagsUrl = "tags_url"
        case blobsUrl = "blobs_url"
        case gitTagsUrl = "git_tags_url"
        case gitRefsUrl = "git_refs_url"
        case treesUrl = "trees_url"
        case statusesUrl = "statuses_url"
        case languagesUrl = "languages_url"
        case stargazersUrl = "stargazers_url"
        case contributorsUrl = "contributors_url"
        case subscribersUrl = "subscribers_url"
        case subscriptionUrl = "subscription_url"
        case commitsUrl = "commits_url"
        case gitCommitsUrl = "git_commits_url"
        case commentsUrl = "comments_url"
        case issueCommentUrl = "issue_comment_url"
        case contentsUrl = "contents_url"
        case compareUrl = "compare_url"
        case mergesUrl = "merges_url"
        case archiveUrl = "archive_url"
        case downloadsUrl = "downloads_url"
        case issuesUrl = "issues_url"
        case pullsUrl = "pulls_url"
        case milestonesUrl = "milestones_url"
        case notificationsUrl = "notifications_url"
        case labelsUrl = "labels_url"
        case releasesUrl = "releases_url"
        case deploymentsUrl = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case gitUrl = "git_url"
        case sshUrl = "ssh_url"
        case cloneUrl = "clone_url"
        case svnUrl = "svn_url"
        case homepage
        case size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case forksCount = "forks_count"
        case mirrorUrl = "mirror_url"
        case archived
        case disabled
        case openIssuesCount = "open_issues_count"
        case license
        case forks
        case openIssues = "open_issues"
        case watchers
        case defaultBranch = "default_branch"

    }
    
    required init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decodeIfPresent(Int.self, forKey: .id)
        nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        privateField = try values.decodeIfPresent(Bool.self, forKey: .privateField)
        owner = try values.decodeIfPresent(RepositoryOwner.self, forKey: .owner)
        permissions = try values.decodeIfPresent(RepositoryPermission.self, forKey: .owner)
        htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
        
        archiveUrl = try values.decodeIfPresent(String.self, forKey: .archiveUrl)
        archived = try values.decodeIfPresent(Bool.self, forKey: .archived)
        assigneesUrl = try values.decodeIfPresent(String.self, forKey: .assigneesUrl)
        blobsUrl = try values.decodeIfPresent(String.self, forKey: .blobsUrl)
        branchesUrl = try values.decodeIfPresent(String.self, forKey: .branchesUrl)
        cloneUrl = try values.decodeIfPresent(String.self, forKey: .cloneUrl)
        collaboratorsUrl = try values.decodeIfPresent(String.self, forKey: .collaboratorsUrl)
        commentsUrl = try values.decodeIfPresent(String.self, forKey: .commentsUrl)
        commitsUrl = try values.decodeIfPresent(String.self, forKey: .commitsUrl)
        compareUrl = try values.decodeIfPresent(String.self, forKey: .compareUrl)
        contentsUrl = try values.decodeIfPresent(String.self, forKey: .contentsUrl)
        contributorsUrl = try values.decodeIfPresent(String.self, forKey: .contributorsUrl)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        defaultBranch = try values.decodeIfPresent(String.self, forKey: .defaultBranch)
        deploymentsUrl = try values.decodeIfPresent(String.self, forKey: .deploymentsUrl)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        downloadsUrl = try values.decodeIfPresent(String.self, forKey: .downloadsUrl)
        eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl)
        fork = try values.decodeIfPresent(Bool.self, forKey: .fork)
        forksCount = try values.decodeIfPresent(Int.self, forKey: .forksCount)
        forksUrl = try values.decodeIfPresent(String.self, forKey: .forksUrl)
        
        gitCommitsUrl = try values.decodeIfPresent(String.self, forKey: .gitCommitsUrl)
        gitRefsUrl = try values.decodeIfPresent(String.self, forKey: .gitRefsUrl)
        gitTagsUrl = try values.decodeIfPresent(String.self, forKey: .gitTagsUrl)
        gitUrl = try values.decodeIfPresent(String.self, forKey: .gitUrl)
        hasDownloads = try values.decodeIfPresent(Bool.self, forKey: .hasDownloads)
        hasIssues = try values.decodeIfPresent(Bool.self, forKey: .hasIssues)
        hasPages = try values.decodeIfPresent(Bool.self, forKey: .hasPages)
        hasWiki = try values.decodeIfPresent(Bool.self, forKey: .hasWiki)
        homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
        hooksUrl = try values.decodeIfPresent(String.self, forKey: .hooksUrl)
        
        
        issueCommentUrl = try values.decodeIfPresent(String.self, forKey: .issueCommentUrl)
        issueEventsUrl = try values.decodeIfPresent(String.self, forKey: .issueEventsUrl)
        issuesUrl = try values.decodeIfPresent(String.self, forKey: .issuesUrl)
        keysUrl = try values.decodeIfPresent(String.self, forKey: .keysUrl)
        labelsUrl = try values.decodeIfPresent(String.self, forKey: .labelsUrl)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        languagesUrl = try values.decodeIfPresent(String.self, forKey: .languagesUrl)
        license = try values.decodeIfPresent(String.self, forKey: .license)
        mergesUrl = try values.decodeIfPresent(String.self, forKey: .mergesUrl)
        milestonesUrl = try values.decodeIfPresent(String.self, forKey: .milestonesUrl)
        mirrorUrl = try values.decodeIfPresent(String.self, forKey: .mirrorUrl)
        
        notificationsUrl = try values.decodeIfPresent(String.self, forKey: .notificationsUrl)
        openIssuesCount = try values.decodeIfPresent(Int.self, forKey: .openIssuesCount)
        
        
        pullsUrl = try values.decodeIfPresent(String.self, forKey: .pullsUrl)
        pushedAt = try values.decodeIfPresent(String.self, forKey: .pushedAt)
        releasesUrl = try values.decodeIfPresent(String.self, forKey: .releasesUrl)
        size = try values.decodeIfPresent(Int.self, forKey: .size)
        sshUrl = try values.decodeIfPresent(String.self, forKey: .sshUrl)
        stargazersCount = try values.decodeIfPresent(Int.self, forKey: .stargazersCount)
        stargazersUrl = try values.decodeIfPresent(String.self, forKey: .stargazersUrl)
        statusesUrl = try values.decodeIfPresent(String.self, forKey: .statusesUrl)
        subscribersUrl = try values.decodeIfPresent(String.self, forKey: .subscribersUrl)
        subscriptionUrl = try values.decodeIfPresent(String.self, forKey: .subscriptionUrl)
        svnUrl = try values.decodeIfPresent(String.self, forKey: .svnUrl)
        tagsUrl = try values.decodeIfPresent(String.self, forKey: .tagsUrl)
        teamsUrl = try values.decodeIfPresent(String.self, forKey: .teamsUrl)
        treesUrl = try values.decodeIfPresent(String.self, forKey: .treesUrl)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        watchersCount = try values.decodeIfPresent(Int.self, forKey: .watchersCount)
    }
}
