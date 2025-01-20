//
//  LocalizationManager.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 20..
//

import Foundation

internal class LocalizationManager: ObservableObject {
    func localized(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
