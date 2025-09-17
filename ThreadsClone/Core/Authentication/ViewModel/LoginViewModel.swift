//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 18/09/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published  var email: String = ""
    @Published  var password: String = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
