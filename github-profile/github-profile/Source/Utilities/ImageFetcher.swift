//
//  ImageFetcher.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import UIKit

final class ImageFetcher {
    
    // MARK: Public API
    
    func fetchImage(at url: URL) async throws -> UIImage {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let image = UIImage(data: data) else {
            throw AppError.parsingFailure
        }
        
        return image
    }
}
