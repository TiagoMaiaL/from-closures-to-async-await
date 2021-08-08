//
//  GithubProfileService.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import Foundation

final class GithubProfileService {
    
    // MARK: Constants
    
    private enum Constants {
        static let rootGithubEndpoint = "https://api.github.com"
        static let usersGithubPath = "/users"
        static let sampleUser = "octocat"
    }
    
    // MARK: Properties
    
    private var userProfileEndpoint: String {
        "\(Constants.rootGithubEndpoint)\(Constants.usersGithubPath)/\(Constants.sampleUser)"
    }
    
    // MARK: Public API
    
    func fetchProfile() async throws -> User {
        guard let url = URL(string: userProfileEndpoint) else {
            preconditionFailure("Malformed URL")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try parseDataToUser(data)
    }
    
    private func parseDataToUser(_ data: Data) throws -> User {
        let decoder = JSONDecoder()
        return try decoder.decode(User.self, from: data)
    }
}
