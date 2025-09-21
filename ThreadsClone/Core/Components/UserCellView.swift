//
//  UserCellView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 11/09/25.
//

import SwiftUI

struct UserCellView: View {
    let user: User
    
    var body: some View {
        HStack{
            CircularProfileView(profileImageUrl: user.profileImageUrl)
            
            VStack(alignment: .leading){
                Text(user.fullName)
                    .fontWeight(.bold)
                
                Text("@\(user.fullName)")
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.bold)
                .frame(width: 80, height: 32)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCellView(user: User(id: "123", fullName: "John Doe", email: "john@example.com", username: "johndoe"))
}
