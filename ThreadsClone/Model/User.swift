//
//  User.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 18/09/25.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
