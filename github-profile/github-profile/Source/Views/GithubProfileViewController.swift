//
//  GithubProfileViewController.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import UIKit

class GithubProfileViewController: UIViewController {
    
    // MARK: Properties
    
    private let viewModel = GithubProfileViewModel()
    
    // MARK: Lifecycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchProfile()
    }
    
    // MARK: Private methods
    
    private func fetchProfile() {
        // TODO: Display loading
        viewModel.fetchProfile { userViewModel in
            // TODO: Hide loading
            // TODO: Display user info
            debugPrint(userViewModel)
        }
    }
}
