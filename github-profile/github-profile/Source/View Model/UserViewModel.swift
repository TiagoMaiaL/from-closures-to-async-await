//
//  UserViewModel.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import UIKit

struct UserViewModel {
    let name: String
    let location: String?
    let avatar: UIImage
    let repositoriesCount: Int
    let blog: String?
    let company: String?
    let bio: String?
    var repositoriesCountText: String {
        "\(repositoriesCount) \(repositoriesCount == 1 ? "repository" : "repositories")"
    }
    
    init(_ user: User, avatar: UIImage) {
        self.avatar = avatar
        name = user.name ?? user.login
        location = user.login
        repositoriesCount = user.publicRepositoriesCount
        blog = user.blog
        company = user.company
        bio = user.bio
    }
}
