//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 11/09/25.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        // fullname and username
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Saksham Tyagi")
                                .font(.title2.bold())
                                .fontWeight(.semibold)
                            
                            Text("@sakshamtyagi")
                                .font(.subheadline)
                        }
                        
                        Text("iOS Developer | Tech Enthusiast | Coffee Lover ☕️ | Sharing my journey in coding and life.")
                            .font(.footnote)
                            
                        Text("250 Following  •  1M Followers")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    CircularProfileView()
                    
                }
                .padding()
                
                Button{
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(Color.black)
                        .cornerRadius(8)
                }
                .padding()
                
                // user content view list
                
                VStack {
                    HStack{
                        ForEach(ProfileThreadFilter.allCases) { filter in
                            VStack{
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                
                                if selectedFilter == filter {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: filterBarWidth, height: 1)
                                        .matchedGeometryEffect(id: "filter", in: animation)
                                } else {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: filterBarWidth, height: 1)
                                }
                                
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    self.selectedFilter = filter
                                }
                            }
                        }
                    }
                    
                    LazyVStack{
                        ForEach(0..<10, id: \.self) { _ in
                            ThreadCell()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
