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
}
