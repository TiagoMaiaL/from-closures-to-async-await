//
//  NetworkingClient.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import Foundation

final class NetworkingClient {
    
    // MARK: Properties
    
    private let session = URLSession.shared
    
    // MARK: Public API
    
    func performHttpCall(_ url: URL, completionHandler: @escaping (Result<Data?, Error>) -> Void) -> CancellableCall {
        let dataTask = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completionHandler(.failure(.connectionFailure))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completionHandler(.failure(.unknown))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completionHandler(.failure(.responseError(httpResponse)))
                return
            }
            
            completionHandler(.success(data))
        }
        
        dataTask.resume()
        
        return dataTask
    }
}

extension NetworkingClient {
    enum Error: Swift.Error {
        case connectionFailure
        case responseError(_ response: HTTPURLResponse)
        case unknown
    }
}

protocol CancellableCall {
    func cancel()
}

extension URLSessionDataTask: CancellableCall {}
