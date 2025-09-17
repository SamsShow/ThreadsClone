//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 18/09/25.
//

import Foundation
import FirebaseAuth

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
            print("Debug: User created with ID: \(result.user.uid)")
        } catch {
            print("Debug: Failed to create user - \(error.localizedDescription)")
            
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("Debug: User created with ID: \(result.user.uid)")
        } catch {
            print("Debug: Failed to create user - \(error.localizedDescription)")
            
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() // for backend
        self.userSession = nil // for frontend
    }
}

