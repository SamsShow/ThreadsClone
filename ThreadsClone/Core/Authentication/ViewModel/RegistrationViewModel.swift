//
//  RegestrationViewModel.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 14/09/25.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published  var email: String = ""
    @Published  var password: String = ""
    @Published  var fullname: String = ""
    @Published  var username: String = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname, username: username)
    }
}
