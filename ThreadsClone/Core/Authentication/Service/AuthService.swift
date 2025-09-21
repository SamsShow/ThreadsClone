//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 18/09/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("Debug: Failed to create user - \(error.localizedDescription)")
            
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uplaodUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
        } catch {
            print("Debug: Failed to create user - \(error.localizedDescription)")
            
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() // for backend
        self.userSession = nil // for frontend
        UserService.shared.resetUser()
    }
    
    private func uplaodUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String
    )async throws {
        // Upload user data to Firestore
        let user = User(id: id, fullName: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }

}

