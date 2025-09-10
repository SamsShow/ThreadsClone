//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 11/09/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack {
                    ForEach(0..<15, id: \.self) { index in
                        VStack{
                            UserCellView()
                            
                            Divider()
                                
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
