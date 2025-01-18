//
//  ContentView.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 17..
//

import SwiftUI

struct RepositoryListView: View {
    @StateObject private var viewModel = RepositoriesViewModel()
    @State private var searchText = ""
        
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.repositories) { repo in
                    VStack(alignment: .leading) {
                        Text(repo.name ?? "")
                            .font(.headline)
                        Text(repo.description ?? "No description available")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(repo.lastModifiedDate ?? "No update time available")
                        Text("⭐ \(repo.stargazerCount ?? 1)")
                            .font(.caption)
                    }
                }
                .searchable(text: $searchText,
                            placement: .automatic,
                            prompt: "Enter repository name") {
                    ForEach(searchResults, id: \.self) { result in
                                    Text("Are you looking for \(result)?").searchCompletion(result)
                                }
                }
                .textInputAutocapitalization(.never)
                .onAppear {
                    viewModel.searchRepositories(query: searchText)
                }
                .onChange(of: searchText) {
                    viewModel.searchRepositories(query: searchText)
                }
                .onSubmit(of: .search) { viewModel.searchRepositories(query: searchText)
                }
                .refreshable {
                    viewModel.searchRepositories(query: searchText)
                }
            }
            .navigationTitle("GitHub Repositories")

        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return viewModel.keywords
        } else {
            return viewModel.keywords.filter { $0.contains(searchText) }
        }
    }
}

#Preview {
    RepositoryListView()
}
