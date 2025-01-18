//
//  ContentView.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 17..
//

import SwiftUI

struct RepositoryListView: View {
    @StateObject private var viewModel: RepositoriesViewModel
    @State private var searchText = ""
    @State private var isLoading = false
    
    init(networkManager: NetworkManager) {
        _viewModel = StateObject(wrappedValue: RepositoriesViewModel(networkManager: networkManager))
    }
        
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                if isLoading {
                    
                }
                VStack {
                    List(viewModel.repositories) { repo in
                        RepositoryCellView(name: repo.name,
                                           stargazerCount: repo.stargazerCount,
                                           description: repo.description,
                                           lastModifiedDate: repo.lastModifiedDate)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.purple.opacity(0.1))
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
                    .onChange(of: searchText) { viewModel.searchRepositories(query: searchText) }
                    .onSubmit(of: .search) { viewModel.searchRepositories(query: searchText) }
                    .refreshable { viewModel.searchRepositories(query: searchText) }
                    .scrollContentBackground(.hidden)
                    .background(Color.blue.opacity(0.1))
                    .listStyle(PlainListStyle())
                    .frame(maxWidth: .infinity)
                }
                .navigationTitle("GitHub Repositories")
            }
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
    let networkManager = NetworkManager()
    
    RepositoryListView(networkManager: networkManager)
}
