//
//  RepositoryDetailsView.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 19..
//

import SwiftUI

struct RepositoryDetailsView: View {
    var data: RepositoryDetailsViewItemViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                headerView
                
                separatorView
                    .padding(.bottom, 16)
                
                repoInformationView
                
                separatorView
                    .padding(.bottom, 8)

                creationAndLastModificationDateView
                
                Spacer()
                
            }
        }
    }
}

// MARK: - Header View setup

extension RepositoryDetailsView {
    private var headerView: some View {
        VStack {
            AsyncImage(url: URL(string: data.ownerImageLink)!) { image in
                image.image?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
            }
            .padding(16)
            
            Text(data.ownerName)
                .font(.title)
                .padding(.bottom, 4)
            
            Text(data.ownerLink)
                .font(.caption)
                .padding(.bottom, 16)
        }
    }
}

// MARK: - Separator View setup

extension RepositoryDetailsView {
    private var separatorView: some View {
        Rectangle()
            .frame(height: 1)
            .padding([.leading, .trailing], 16)
            .foregroundStyle(.gray.opacity(0.5))
    }
}

// MARK: - Repo Information View setup

extension RepositoryDetailsView {
    private var repoInformationView: some View {
        VStack {
            HStack {
                Text(data.repoName)
                    .font(.title)
                Spacer()
            }
                .padding([.leading, .trailing], 16)
                .padding(.bottom, 8)
            
            HStack() {
                Text(data.description)
                    .font(.title3)
                    .foregroundStyle(.gray)
                Spacer()
            }
                .padding([.leading, .trailing], 16)
                .padding(.bottom, 8)
            
            HStack {
                Text("⭐ \(data.stargazerCount)")
                    .font(.caption)
                Spacer()
                Text("🍴 \(data.forkCount)")
                    .font(.caption)
            }
            .padding([.leading, .trailing], 16)
            .padding(.bottom, 8)
        }
    }
}

// MARK: - Creation and Last Modification Date View setup

extension RepositoryDetailsView {
    private var creationAndLastModificationDateView: some View {
        HStack {
            Text(data.createdDate)
                .font(.caption)
            Spacer()
            Text(data.lastModifiedDate)
                .font(.caption)
                .multilineTextAlignment(.trailing) 
        }
        .padding([.leading, .trailing], 16)
        .padding(.bottom, 8)
    }
}

// MARK: - Preview setup

#Preview {
    let localizationManager = LocalizationManager()
    let data = RepositoryDetailsViewItemViewModel(ownerImageLink: "https://avatars.githubusercontent.com/u/2131270?v=4",
                                                  ownerName: "qbittorrent",
                                                  ownerLink: "https://api.github.com/users/qbittorrent",
                                                  repoName: "qBittorrent",
                                                  description: "qBittorrent BitTorrent client",
                                                  repoLink: "https://github.com/qbittorrent/qBittorrent",
                                                  stargazerCount: 29463,
                                                  forkCount: 4077,
                                                  createdDate: "2012-02-04T09:37:46Z",
                                                  lastModifiedDate: "2025-01-17T19:23:05Z",
                                                  localizationManager: localizationManager)
    
    RepositoryDetailsView(data: data)
}
