//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 07/09/25.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullname: String = ""
    @State private var username: String = ""
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack{
            Spacer()
            
            Image("Logo1")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(.bottom, 20)
//                .padding(.top, 160)
            
            VStack(spacing: 20) {
                VStack(spacing: 12) {
                    TextField("Enter Your Email", text: $email)
                        .modifier(ThreadsTextFieldModifiers())
                    
                    SecureField("Enter Your Password", text: $password)
                        .modifier(ThreadsTextFieldModifiers())
                    
                    TextField("Enter Your Email", text: $fullname)
                        .modifier(ThreadsTextFieldModifiers())
                    
                    TextField("Enter Your Email", text: $username)
                        .modifier(ThreadsTextFieldModifiers())
                }
                .padding(.horizontal)
            }
            
            
            Button {
                // Action will go here
            } label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.black)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack{
                    Text("Already have an account?")
                        .foregroundColor(.black)
                        .font(.footnote)
                    
                    Text("Log in")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.footnote)
                }
            }
            .padding(.vertical, 16)
            
        }
    }
}

#Preview {
    RegistrationView()
}
