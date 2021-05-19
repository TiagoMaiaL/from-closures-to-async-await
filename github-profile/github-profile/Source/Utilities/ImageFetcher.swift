//
//  ImageFetcher.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import UIKit

final class ImageFetcher {
    
    // MARK: Properties
    
    private let client = NetworkingClient()
    
    // MARK: Public API
    
    func fetchImage(at url: URL) async throws -> UIImage {
        guard let data = try await client.performHttpCall(at: url) else {
            throw AppError.emptyResponse
        }
        
        guard let image = UIImage(data: data) else {
            throw AppError.parsingFailure
        }
        
        return image
    }
}
