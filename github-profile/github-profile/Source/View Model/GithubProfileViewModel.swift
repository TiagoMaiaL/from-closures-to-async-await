//
//  GithubProfileViewModel.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import UIKit

final class GithubProfileViewModel {
    
    // MARK: Properties
    
    private let service = GithubProfileService()
    
    private let imageFetcher = ImageFetcher()
    
    // MARK: Public API
    
    func fetchProfile() async throws -> UserViewModel {
        let user = try await service.fetchProfile()
        
        guard let avatarUrl = user.avatarUrl else {
            // TODO: Figure out if the avatar url can be nil.
            throw AppError.fetchFailure
        }
        
        let avatar = try await imageFetcher.fetchImage(at: avatarUrl)
        return UserViewModel(user, avatar: avatar)
    }
}
