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
    
    public init() {}

    public init(id: Int?, name: String?, description: String?, stargazerCount: Int?, lastModifiedDate: String?) {
        self.id = id
        self.name = name
        self.description = description
        self.stargazerCount = stargazerCount
        self.lastModifiedDate = lastModifiedDate
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case stargazerCount = "stargazers_count"
        case lastModifiedDate = "updated_at"
    }
}
