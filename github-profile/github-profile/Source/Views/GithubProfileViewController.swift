//
//  GithubProfileViewController.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import UIKit

class GithubProfileViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet private var profileContainerStack: UIStackView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var usernameLabel: UILabel!
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var bioLabel: UILabel!
    @IBOutlet private var locationLabel: UILabel!
    @IBOutlet private var companyLabel: UILabel!
    @IBOutlet private var blogLabel: UILabel!
    @IBOutlet private var repositoriesCountLabel: UILabel!
    
    private let viewModel = GithubProfileViewModel()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchProfile()
    }
    
    // MARK: Private methods
    
    private func setup() {
        profileContainerStack.isHidden = true
    }
    
    private func fetchProfile() {
        activityIndicator.startAnimating()
        profileContainerStack.isHidden = true
        
        viewModel.fetchProfile { [weak self] userViewModel in
            self?.activityIndicator.stopAnimating()
            self?.profileContainerStack.isHidden = false
            debugPrint(userViewModel)
        }
    }
}
