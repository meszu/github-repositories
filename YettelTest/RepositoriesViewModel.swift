//
//  RepositoriesViewModel.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 17..
//

import Foundation
import Combine

public class RepositoriesViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var errorMessage: String? = nil
    @Published var keywords: [String] = ["data", "swift", "machine learning", "artifical intelligence", "game"]
    
    private var cancellables = Set<AnyCancellable>()
    
    func searchRepositories(query: String) {
        if query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            repositories = []
            return
        }
        
        NetworkManager.shared.getRepositories(query: query)
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
