//
//  RepositoriesViewModel.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 17..
//

import Combine
import Foundation

internal class RepositoriesViewModel: ObservableObject {
    
    // MARK: - Public variables
    
    @Published var repositories: [Repository] = []
    @Published var keywords: [String] = ["data", "swift", "machine learning", "artifical intelligence", "game"]
    @Published var errorMessage: String? = nil
    @Published var isLoading = false
    
    // MARK: - Private variables
    
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Managers
    
    private var networkManager: NetworkingManager
    
    // MARK: - Init
    
    init(networkManager: NetworkingManager) {
        self.networkManager = networkManager
    }
    
    // MARK: - Public methods
    
    func searchRepositories(query: String) {
        isLoading = true
        
        if query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            isLoading = false
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
                let reposWithValidId = repositories.filter { $0.id != nil }
                let reposWithFormattedDate = reposWithValidId.map { [weak self] repository in
                    guard let self else { return repository }
                    return formatLastModifiedDate(in: repository)
                }
                self.repositories = reposWithFormattedDate
                isLoading = false
            })
            .store(in: &cancellables)
    }
    
    // MARK: - Private methods
    
    private func formatLastModifiedDate(in repository: Repository) -> Repository {
        var repo = repository
        
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime]
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMMM dd, yyyy 'at' h:mm a"
        outputFormatter.timeZone = TimeZone.current
        
        if let date = isoFormatter.date(from: repo.lastModifiedDate ?? "") {
            let formattedLastModifiedDate = outputFormatter.string(from: date)
            repo.lastModifiedDate = formattedLastModifiedDate
        }
        
        return repo
    }
}
