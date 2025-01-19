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
                VStack {
                    if viewModel.isLoading {
                        VStack(alignment: .center) {
                            Spacer()
                            HStack(alignment: .center) {
                                Spacer()
                                ProgressView("Loading...")
                                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                                    .padding()
                                Spacer()
                            }
                            Spacer()
                        }
                    } else {
                        List(viewModel.repositories) { repo in
                            NavigationLink(destination: createRepositoryDetailView(with: repo)) {
                                RepositoryCellView(name: repo.name,
                                                   stargazerCount: repo.stargazerCount,
                                                   description: repo.description,
                                                   lastModifiedDate: repo.lastModifiedDate)
                            }
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
                        .onChange(of: searchText) { if searchText.isEmpty {
                            viewModel.searchRepositories(query: searchText)
                        }
                        }
                        .onSubmit(of: .search) { viewModel.searchRepositories(query: searchText) }
                        .refreshable { viewModel.searchRepositories(query: searchText) }
                        .scrollContentBackground(.hidden)
                        .background(Color.blue.opacity(0.1))
                        .listStyle(PlainListStyle())
                        .frame(maxWidth: .infinity)
                    }
                }
                .navigationTitle("GitHub Repositories")
                .background(Color.blue.opacity(0.1))
            }
        }
    }
    
    private func createRepositoryDetailView(with repo: Repository) -> RepositoryDetailsView {
        let data = RepositoryDetailsViewItemViewModel(ownerImageLink: repo.owner?.avatarUrl,
                                                      ownerName: repo.owner?.login,
                                                      ownerLink: repo.owner?.gitHubUrl,
                                                      repoName: repo.name,
                                                      description: repo.description,
                                                      repoLink: repo.repoUrl,
                                                      stargazerCount: 29463,
                                                      forkCount: 4077,
                                                      createdDate: repo.createdDate,
                                                      lastModifiedDate: repo.lastModifiedDate)
        
        return RepositoryDetailsView(data: data)
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
