//
//  Repositories.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 17..
//

import Foundation

public struct Repositories: Codable {
    public var repositories: [Repository]?
    
    public init() {}

    public init(repositories: [Repository]?) {
        self.repositories = repositories
    }
    
    private enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
}
