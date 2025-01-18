//
//  NetworkManager.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 17..
//

import Combine
import Foundation

internal protocol NetworkingManager {
    func getRepositories(query: String) -> AnyPublisher<[Repository], Error>
}

internal class NetworkManager: NetworkingManager {
    private let baseURL = "https://api.github.com/search/repositories?q="
    
    func getRepositories(query: String) -> AnyPublisher<[Repository], Error> {
        guard let url = URL(string: "\(baseURL)\(query)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Repositories.self, decoder: JSONDecoder())
            .compactMap { $0.repositories }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
