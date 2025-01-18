//
//  RepositoryDetails.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 17..
//

import Foundation

public struct RepositoryDetails {
    var id: Int?
    var name: String?
    var description: String?
    var repoUrl: String?
    var stargazersCount: Int?
    var forksCount: Int?
    var createdDate: String?
    var lastModifiedDate: String?
    
    public init() {}
    
    public init(id: Int?,
                name: String?,
                description: String?,
                repoUrl: String?,
                stargazersCount: Int?,
                forksCount: Int?,
                createdDate: String?,
                lastModifiedDate: String?) {
        self.id = id
        self.name = name
        self.description = description
        self.repoUrl = repoUrl
        self.stargazersCount = stargazersCount
        self.forksCount = forksCount
        self.createdDate = createdDate
        self.lastModifiedDate = lastModifiedDate
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case repoUrl = "html_url"
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case createdDate = "created_at"
        case lastModifiedDate = "updated_at"
    }
}
