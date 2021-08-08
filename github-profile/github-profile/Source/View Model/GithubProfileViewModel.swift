//
//  GithubProfileViewModel.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import UIKit
import Combine

@MainActor
final class GithubProfileViewModel {
    
    // MARK: Properties
    
    private let service = GithubProfileService()
    private let imageFetcher = ImageFetcher()
    let userSubject = PassthroughSubject<UserViewModel, Never>()
    private var profileTask: Task<Void, Error>?
    
    // MARK: Public API
    
    func fetchProfile() {
        profileTask?.cancel()
        profileTask = Task.detached(priority: .userInitiated) { [weak self] in
            guard let self = self else {
                return
            }
            
            let user = try await self.service.fetchProfile()
            
            guard let avatarUrl = user.avatarUrl else {
                throw AppError.fetchFailure
            }
            
            let avatar = try await self.imageFetcher.fetchImage(at: avatarUrl)
            
            guard !Task.isCancelled else {
                return
            }
            
            await self.setForDisplay(UserViewModel(user, avatar: avatar))
        }
    }
    
    func setForDisplay(_ viewModel: UserViewModel) {
        userSubject.send(viewModel)
    }
}
