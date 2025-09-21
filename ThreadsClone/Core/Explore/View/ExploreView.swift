//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 11/09/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.users.isEmpty {
                    VStack(spacing: 20) {
                        Text("No users found")
                            .font(.headline)
                        
                        Button(action: {
                            Task { await viewModel.fetchUsers() }
                        }) {
                            Text("Refresh Users")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 40)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.top, 50)
                } else {
                    ScrollView{
                        
                        LazyVStack {
                            ForEach(viewModel.users) { user in
                                VStack{
                                    UserCellView(user: user)
                                    
                                    Divider()
                                        
                                }
                                .padding(.vertical, 5)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
            .onChange(of: searchText) { _, newValue in
                Task { await viewModel.fetchUsers(withSearch: newValue) }
            }
            .onAppear {
                Task { await viewModel.fetchUsers() }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        Task { await viewModel.fetchUsers() }
                    }) {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
