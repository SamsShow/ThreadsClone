import Foundation
import FirebaseFirestore
import FirebaseAuth

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { await fetchUsers() }
    }
    
    @MainActor
    func fetchUsers(withSearch searchText: String = "") async {
        do {
            print("DEBUG: Attempting to fetch users directly")
            
            // Direct Firestore fetch without filtering
            let snapshot = try await Firestore.firestore().collection("users").getDocuments()
            print("DEBUG: Firestore returned \(snapshot.documents.count) documents")
            
            // Process documents manually to avoid filtering issues
            var fetchedUsers = [User]()
            
            for document in snapshot.documents {
                do {
                    if let id = document.data()["id"] as? String,
                       let fullName = document.data()["fullName"] as? String,
                       let email = document.data()["email"] as? String, 
                       let username = document.data()["username"] as? String {
                        
                        let profileImageUrl = document.data()["profileImageUrl"] as? String
                        let bio = document.data()["bio"] as? String
                        
                        let user = User(id: id, 
                                      fullName: fullName, 
                                      email: email, 
                                      username: username, 
                                      profileImageUrl: profileImageUrl, 
                                      bio: bio)
                        
                        fetchedUsers.append(user)
                        print("DEBUG: Successfully processed user: \(username)")
                    }
                } catch {
                    print("DEBUG: Failed to process document with ID: \(document.documentID), error: \(error.localizedDescription)")
                }
            }
            
            print("DEBUG: Manually processed \(fetchedUsers.count) users")
            
            // Set all users and then filter if needed
            self.users = fetchedUsers
            
            if !searchText.isEmpty {
                self.users = self.users.filter {
                    $0.username.contains(searchText.lowercased()) ||
                    $0.fullName.lowercased().contains(searchText.lowercased())
                }
            }
            
            print("DEBUG: Final user count: \(self.users.count)")
        } catch {
            print("DEBUG: Failed to fetch users with error: \(error.localizedDescription)")
        }
    }
}
