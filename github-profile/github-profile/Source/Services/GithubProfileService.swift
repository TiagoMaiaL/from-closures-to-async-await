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
    
    // MARK: Public API
    
    public func fetchProfile(completionHandler: @escaping (Result<User, AppError>) -> Void) {
        let userProfileEndpoint = "\(Constants.rootGithubEndpoint)\(Constants.usersGithubPath)/\(Constants.sampleUser)"
        
        guard let url = URL(string: userProfileEndpoint) else {
            preconditionFailure("Malformed URL")
        }
        
        fetchCall?.cancel()
        fetchCall = client.performHttpCall(url) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let data):
                guard let data = data else {
                    completionHandler(.failure(.emptyResponse))
                    return
                }
                
                do {
                    let user = try self.parseToUser(data)
                    completionHandler(.success(user))
                } catch {
                    debugPrint(error)
                    completionHandler(.failure(.parsingFailure))
                }
                
            case .failure:
                completionHandler(.failure(.fetchFailure))
            }
        }
    }
    
    private func parseToUser(_ data: Data) throws -> User {
        let decoder = JSONDecoder()
        return try decoder.decode(User.self, from: data)
    }
}
