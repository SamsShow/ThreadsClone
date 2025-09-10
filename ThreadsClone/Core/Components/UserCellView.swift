//
//  UserCellView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 11/09/25.
//

import SwiftUI

struct UserCellView: View {
    var body: some View {
        HStack{
            CircularProfileView()
            
            VStack(alignment: .leading){
                Text("Username")
                    .fontWeight(.bold)
                
                Text("@username")
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
    UserCellView()
}
