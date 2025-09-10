//
//  FeedView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 07/09/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<10, id: \.self) { index in
                        ThreadCell()
                    }
                }
            }
            .refreshable {
                print("Refreshed")
            }
            
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    FeedView()
}
