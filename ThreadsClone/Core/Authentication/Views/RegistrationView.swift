//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 07/09/25.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewModel()
  
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
                    TextField("Enter Your Email", text: $viewModel.email)
                        .modifier(ThreadsTextFieldModifiers())
                    
                    SecureField("Enter Your Password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifiers())
                    
                    TextField("Enter Your fullname", text: $viewModel.fullname)
                        .modifier(ThreadsTextFieldModifiers())
                    
                    TextField("Enter Your username", text: $viewModel.username)
                        .modifier(ThreadsTextFieldModifiers())
                }
                .padding(.horizontal)
            }
            
            
            Button {
                // Action will go here
                Task{ try await viewModel.createUser() }
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
