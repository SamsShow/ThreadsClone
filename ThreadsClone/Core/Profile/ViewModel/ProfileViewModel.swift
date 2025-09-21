//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 21/09/25.
//

import Foundation
import Combine


class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink {[weak self] user in
            self?.currentUser = user
            print("DEBUG: User in ProfileViewModel is \(user)")
        }.store(in: &cancellables)
    }
}

