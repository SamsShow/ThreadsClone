//
//  ThreadsTabView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 07/09/25.
//

import SwiftUI

struct ThreadsTabView: View {
    
    @State private var selectedTab: Int = 0
    @State private var showCreateSheet: Bool = false
    @State private var previousTab: Int = 0 // Store the previous tab
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab==0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab==0 ? .fill : .none)
                    Text("Home")
                }
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
                .tag(1)
            
            
            Color.clear // Empty view for Create tab
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
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab==4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab==4 ? .fill : .none)
                    Text("Profile")
                }
                .tag(4)

        }
        .onChange(of: selectedTab) { oldValue, newValue in
            if newValue == 2 {
                // Save the previous tab before showing the sheet
                previousTab = oldValue
                
                // When user selects the create tab, show the sheet
                showCreateSheet = true
                
                // Immediately set the tab back to previous tab
                selectedTab = previousTab
            }
        }
        .sheet(isPresented: $showCreateSheet, onDismiss: {
            // Return to the previous tab when sheet is dismissed
            selectedTab = previousTab
        }) {
            ThreadCreationView()
        }
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}
