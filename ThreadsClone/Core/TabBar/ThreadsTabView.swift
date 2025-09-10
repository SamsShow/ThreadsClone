//
//  ThreadsTabView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 07/09/25.
//

import SwiftUI

struct ThreadsTabView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab==0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab==0 ? .fill : .none)
                    Text("Home")
                }
                .onAppear {
                    selectedTab = 0
                }
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }.onAppear {
                    selectedTab = 1
                }
                .tag(1)
            
            
            ThreadCreationView()
                .tabItem {
                    Image(systemName: "plus.app.fill")
                        .renderingMode(.template)
                        .imageScale(.large)
                        .font(.system(size: 23))
                        .symbolRenderingMode(.hierarchical)
                    Text("Create")
                }
                .tag(2)
            
            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab==3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab==3 ? .fill : .none)
                    Text("Activity")
                }.onAppear {
                    selectedTab = 3
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab==4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab==4 ? .fill : .none)
                    Text("Profile")
                }.onAppear {
                    selectedTab = 4
                }
                .tag(4)

        }.tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}
