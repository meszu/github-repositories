//
//  YettelTestApp.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 17..
//

import SwiftUI

@main
struct YettelTestApp: App {
    @StateObject private var localizationManager = LocalizationManager()
    
    private let networkManager = NetworkManager()

    var body: some Scene {
        WindowGroup {
            RepositoryListView(networkManager: networkManager)
                .environmentObject(localizationManager)
        }
    }
}
