//
//  ThreadCreationView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 11/09/25.
//

import SwiftUI

struct ThreadCreationView: View {
    @State private var caption: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack(alignment: .top) {
                    CircularProfileView()
                    
                    VStack(alignment: .leading) {
                        Text("Username")
                            .fontWeight(.bold)
                        
                        TextField("Start a thread...", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                }
            }
                
        }
    }
}

#Preview {
    ThreadCreationView()
}
