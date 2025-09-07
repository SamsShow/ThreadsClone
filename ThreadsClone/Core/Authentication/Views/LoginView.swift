//
//  LoginView.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 05/09/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                    
                Image("Logo1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.bottom, 20)
                    .padding(.top, 160)

                VStack(spacing: 20) {
                    VStack(spacing: 12) {
                        TextField("Enter Your Email", text: $email)
                            .autocapitalization(.none)
                            .modifier(ThreadsTextFieldModifiers())
                        
                        SecureField("Enter Your Password", text: $password)
                            .modifier(ThreadsTextFieldModifiers())
                    }
                    .padding(.horizontal)
                    
                    Button {
                        // Action will go here
                    } label: {
                        Text("Login")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(Color.black)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    NavigationLink {
                        Text("Forgot Password?")
                    } label: {
                        Text("Forgot Password?")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .font(.footnote)
                    }
                    
                    Spacer()
                    Divider()
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack {
                            Text("Don't have an account?")
                                .foregroundColor(.black)
                            Text("Sign Up")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                        .font(.footnote)
                        .padding(.vertical, 16)
                    }
                }
            }
            
        }
    }
}

#Preview {
    LoginView()
}
