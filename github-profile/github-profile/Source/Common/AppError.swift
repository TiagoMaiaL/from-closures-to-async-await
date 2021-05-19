//
//  AppError.swift
//  github-profile
//
//  Created by Tiago Lopes on 18/05/21.
//

import Foundation

enum AppError: Error {
    case connectionFailure
    case parsingFailure
    case responseFailure(response: HTTPURLResponse)
    case emptyResponse
    case fetchFailure
    case unknown
}
