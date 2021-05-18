//
//  User.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import Foundation

struct User: Codable {
    let login: String
    let name: String?
    let location: String?
    let avatarUrl: URL?
    let publicRepositoriesCount: Int
    let blog: String?
    let company: String?
    let bio: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case publicRepositoriesCount = "public_repos"
        
        case login
        case name
        case location
        case blog
        case company
        case bio
    }
}
