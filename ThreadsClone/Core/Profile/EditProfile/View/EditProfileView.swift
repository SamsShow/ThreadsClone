//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 11/09/25.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var bio: String = ""
    @State private var link: String = ""
    @State private var isPrivateProfile: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text("Username")
                                
                        }.font(.footnote)
                        
                        Spacer()
                        
                        CircularProfileView()
                        
                    }
                    Divider()
                    
                    
                    VStack (alignment: .leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                            
                        TextField("Enter Your Bio....", text: $bio, axis: .vertical)
                            
                    }
                    
                    
                    Divider()
                    
                    VStack (alignment: .leading){
                        Text("Link")
                            .fontWeight(.semibold)
                            
                        TextField("Add Links....", text: $link, axis: .vertical)
                            
                    }
                    
                    
                    Divider()
                    
                    Toggle("Private Account", isOn: $isPrivateProfile)
                    
                    Divider()
                        
                }
                .font(.footnote)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 2)
                .padding()
                
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
                

            }
        }
    }
}

#Preview {
    EditProfileView()
}
