//
//  UserService.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 21/09/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
    }
    
    static func fetchUser() async throws -> [User]? {
        do {
            guard let currentUid = Auth.auth().currentUser?.uid else { return nil }
            
            // Get all users
            let snapshot = try await Firestore.firestore().collection("users").getDocuments()
            let users = snapshot.documents.compactMap { doc -> User? in
                do {
                    return try doc.data(as: User.self)
                } catch {
                    print("DEBUG: Failed to decode user document with ID \(doc.documentID): \(error.localizedDescription)")
                    return nil
                }
            }
            
            // Return all users INCLUDING current user for now (to fix display issue)
            return users
        } catch {
            print("DEBUG: Failed to fetch users with error \(error.localizedDescription)")
            return nil
        }
    }
    
    func resetUser() {
        self.currentUser = nil
    }
}
