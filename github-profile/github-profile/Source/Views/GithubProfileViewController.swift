//
//  GithubProfileViewController.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import UIKit

class GithubProfileViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    private let viewModel = GithubProfileViewModel()
    
    // MARK: Lifecycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchProfile()
    }
    
    // MARK: Private methods
    
    private func fetchProfile() {
        activityIndicator.startAnimating()
        viewModel.fetchProfile { [weak self] userViewModel in
            self?.activityIndicator.stopAnimating()
            debugPrint(userViewModel)
        }
    }
}
