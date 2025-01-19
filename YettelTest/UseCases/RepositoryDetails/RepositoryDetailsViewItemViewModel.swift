//
//  RepositoryDetailsViewItemViewModel.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 19..
//

import Foundation

internal struct RepositoryDetailsViewItemViewModel {
    var ownerImageLink: String
    var ownerName: String
    var ownerLink: String
    var repoName: String
    var description: String
    var repoLink: String
    var stargazerCount: String
    var forkCount: String
    var createdDate: String
    var lastModifiedDate: String
    
    init(ownerImageLink: String?,
         ownerName: String?,
         ownerLink: String?,
         repoName: String?,
         description: String?,
         repoLink: String?,
         stargazerCount: Int?,
         forkCount: Int?,
         createdDate: String?,
         lastModifiedDate: String?) {
        self.ownerImageLink = ownerImageLink ?? ""
        self.ownerName = ownerName ?? ""
        self.ownerLink = ownerLink ?? ""
        self.repoName = repoName ?? ""
        self.description = description ?? ""
        self.repoLink = repoLink ?? ""
        self.stargazerCount = String(stargazerCount ?? 0)
        self.forkCount = String(forkCount ?? 0)
        self.createdDate = "Creation date: " + (createdDate ?? "")
        self.lastModifiedDate = "Last modification date: " + (lastModifiedDate ?? "")
    }
    
    init() {
        ownerImageLink = ""
        ownerName = ""
        ownerLink = ""
        repoName = ""
        description = ""
        repoLink = ""
        stargazerCount = "0"
        forkCount = "0"
        createdDate = ""
        lastModifiedDate = ""
    }
}
