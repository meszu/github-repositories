//
//  RepositoriesViewModel.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 17..
//

import Foundation
import Combine

internal class RepositoriesViewModel: ObservableObject {
    
    // MARK: - Public variables
    
    @Published var repositories: [Repository] = []
    @Published var keywords: [String] = ["data", "swift", "machine learning", "artifical intelligence", "game"]
    @Published var errorMessage: String? = nil

    // MARK: - Managers
    
    private var networkManager: NetworkingManager
    
    // MARK: - Init
    
    init(networkManager: NetworkingManager) {
        self.networkManager = networkManager
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func searchRepositories(query: String) {
        if query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            repositories = []
            return
        }
        
        networkManager.getRepositories(query: query)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self else { return }
                
                switch completion {
                case .failure(let error):
                    errorMessage = "Failed to load repositories: \(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] repositories in
                guard let self else { return }
                self.repositories = repositories.filter { $0.id != nil }
            })
            .store(in: &cancellables)
    }
}
