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
    
    func fetchProfile(completionHandler: @escaping (Result<UserViewModel, AppError>) -> Void) {
        service.fetchProfile { [weak self] result in
            switch result {
            case .success(let user):
                guard let avatarUrl = user.avatarUrl else {
                    completionHandler(.failure(.fetchFailure))
                    return
                }
                
                self?.imageFetcher.fetchImage(at: avatarUrl) { avatarResult in
                    switch avatarResult {
                    case .success(let image):
                        completionHandler(.success(UserViewModel(user, avatar: image)))
                        
                    case .failure(let error):
                        debugPrint("Failed fetching avatar")
                        completionHandler(.failure(error))
                    }
                }
                
            case .failure(let error):
                debugPrint("Failed fetching user")
                completionHandler(.failure(error))
            }
        }
    }
}
