//
//  CircularProfileView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 11/09/25.
//

import SwiftUI

struct CircularProfileView: View {
    var profileImageUrl: String?
    
    var body: some View {
        if let imageUrl = profileImageUrl, !imageUrl.isEmpty {
            AsyncImage(url: URL(string: imageUrl)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                case .failure(_), .empty:
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .foregroundColor(Color(.systemGray4))
                @unknown default:
                    ProgressView()
                        .frame(width: 40, height: 40)
                }
            }
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .foregroundColor(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileView()
}
