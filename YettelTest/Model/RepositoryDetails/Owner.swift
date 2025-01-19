//
//  Owner.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 17..
//

import Foundation

public struct Owner: Codable, Equatable {
    public var id: Int?
    public var login: String?
    public var avatarUrl: String?
    public var gitHubUrl: String?
    
    public init() {}
    
    public init(id: Int?, login: String?, avatarUrl: String?, gitHubUrl: String?) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
        self.gitHubUrl = gitHubUrl
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case gitHubUrl = "html_url"
    }
}
