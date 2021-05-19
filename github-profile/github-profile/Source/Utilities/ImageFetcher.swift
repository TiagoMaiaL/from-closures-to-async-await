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
    private var call: CancellableCall?
    
    // MARK: Public API
    
    func fetchImage(at url: URL, withCompletionHandler completionHandler: @escaping (Result<UIImage, AppError>) -> Void) {
        call?.cancel()
        call = client.performHttpCall(url, completionHandler: { result in
            switch result {
            case .success(let data):
                guard let data = data else {
                    completionHandler(.failure(.emptyResponse))
                    return
                }
                
                guard let image = UIImage(data: data) else {
                    completionHandler(.failure(.parsingFailure))
                    return
                }
                
                completionHandler(.success(image))
                
            case .failure:
                completionHandler(.failure(.fetchFailure))
            }
        })
    }
}
