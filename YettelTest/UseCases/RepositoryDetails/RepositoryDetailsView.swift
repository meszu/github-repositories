//
//  RepositoryDetailsView.swift
//  YettelTest
//
//  Created by Kristóf Mészáros, Vodafone Hungary on 2025. 01. 19..
//

import SwiftUI

struct RepositoryDetailsView: View {
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://avatars1.githubusercontent.com/u/674415?v=4")!) { image in
                    image.image?.frame(width: 100, height: 100).clipShape(.circle)
                }
                .padding(16)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.title)
                    .padding(.bottom, 32)
                Text("Hello, World!")
                    .padding(.bottom, 8)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 8)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 8)
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    RepositoryDetailsView()
}
