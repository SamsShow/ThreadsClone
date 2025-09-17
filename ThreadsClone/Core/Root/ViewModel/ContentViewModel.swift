//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 18/09/25.
//

import Foundation
import Combine
import FirebaseAuth

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] user in
            self?.userSession = user
            
        }.store(in: &cancancellables)
    }
}
            
