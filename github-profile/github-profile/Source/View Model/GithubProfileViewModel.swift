//
//  GithubProfileViewModel.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import Foundation

final class GithubProfileViewModel {
    
    // MARK: Properties
    
    private let service = GithubProfileService()
    
    // MARK: Public API
    
    func fetchProfile() {
        service.fetchProfile { result in
            // TODO: Update the displayable values here.
        }
    }
}
