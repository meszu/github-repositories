//
//  RepositoryCellView.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 18..
//

import SwiftUI

struct RepositoryCellView: View {

    let name: String?
    let stargazerCount: Int?
    let description: String?
    let lastModifiedDate: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name ?? "")
                .font(.headline)
                .padding(.bottom, 8)
            Text(description ?? "No description available")
                .font(.subheadline)
                .foregroundColor(.gray)
            HStack {
                Text("⭐ \(stargazerCount ?? 1)")
                    .font(.caption)
                Spacer()
                Text(lastModifiedDate ?? "No update time available")
                    .font(.caption)
            }
            .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .shadow(
                     color: Color.black,
                     radius: 4,
                     x: 0,
                     y: 4
                   )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 2)
        )
    }
}

#Preview {
    RepositoryCellView(name: "SwiftUI",
                       stargazerCount: 1333,
                       description: "SwiftUI repository for SwiftUI development",
                       lastModifiedDate: "2025.01.20.")
}
