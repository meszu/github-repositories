//
//  Repository.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 17..
//

import Foundation

public struct Repository: Codable, Equatable, Identifiable {
    public var id: Int?
    public var name: String?
    public var description: String?
    public var stargazerCount: Int?
    public var lastModifiedDate: String?
    public var owner: Owner?
    public var repoUrl: String?
    public var forksCount: Int?
    public var createdDate: String?
    
    public init() {}

    public init(id: Int?,
                name: String?,
                description: String?,
                stargazerCount: Int?,
                lastModifiedDate: String?,
                owner: Owner?,
                repoUrl: String?,
                forksCount: Int?,
                createdDate: String?) {
        self.id = id
        self.name = name
        self.description = description
        self.stargazerCount = stargazerCount
        self.lastModifiedDate = lastModifiedDate
        self.owner = owner
        self.repoUrl = repoUrl
        self.forksCount = forksCount
        self.createdDate = createdDate
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case stargazerCount = "stargazers_count"
        case lastModifiedDate = "updated_at"
        case owner
        case repoUrl = "html_url"
        case forksCount = "forks_count"
        case createdDate = "created_at"
    }
}
