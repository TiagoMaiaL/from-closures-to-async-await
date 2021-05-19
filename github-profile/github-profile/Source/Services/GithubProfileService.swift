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
    
    private let client = NetworkingClient()
    private var fetchCall: CancellableCall?
    
    private var userProfileEndpoint: String {
        "\(Constants.rootGithubEndpoint)\(Constants.usersGithubPath)/\(Constants.sampleUser)"
    }
    
    // MARK: Public API
    
    public func fetchProfile() async throws -> User {
        guard let url = URL(string: userProfileEndpoint) else {
            preconditionFailure("Malformed URL")
        }
        
        guard let data = try await client.performHttpCall(at: url) else {
            throw AppError.emptyResponse
        }
        
        return try parseDataToUser(data)
    }
    
    private func parseDataToUser(_ data: Data) throws -> User {
        let decoder = JSONDecoder()
        return try decoder.decode(User.self, from: data)
    }
}
