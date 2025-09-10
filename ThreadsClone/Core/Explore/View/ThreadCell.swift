//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 11/09/25.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Username")
                            .font(.footnote)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("2h")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Button {
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Text("This is a sample thread content. It can span multiple lines and should be displayed properly in the cell.")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        
                    HStack {
                        Button {
                        } label: {
                            Image(systemName: "heart")
                        }
                        Button {
                        } label: {
                            Image(systemName: "bubble.left")
                        }
                        Button {
                        } label: {
                            Image(systemName: "arrow.2.squarepath")
                        }
                        Button {
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }.foregroundColor(.black).padding(.vertical, 8)
                    
                }
            }
            Divider()
        }.padding()
    }
}

#Preview {
    ThreadCell()
}
