//
//  YettelTestApp.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 17..
//

import SwiftUI

@main
struct YettelTestApp: App {
    let networkManager = NetworkManager()
    
    var body: some Scene {
        WindowGroup {
            RepositoryListView(networkManager: networkManager)
        }
    }
}
