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
        
        viewModel.fetchProfile { [weak self] result in
            self?.activityIndicator.stopAnimating()
            
            switch result {
            case .success(let user):
                self?.profileContainerStack.isHidden = false
                self?.display(user)
                
            case .failure:
                break
            }
        }
    }
    
    private func display(_ user: UserViewModel) {
        usernameLabel.text = user.name
        avatarImageView.image = user.avatar
        repositoriesCountLabel.text = user.repositoriesCountText
        
        bioLabel.isHidden = user.bio == nil
        bioLabel.text = user.bio
        
        locationLabel.isHidden = user.location == nil
        locationLabel.text = user.location
        
        companyLabel.isHidden = user.company == nil
        companyLabel.text = user.company
        
        blogLabel.isHidden = user.blog == nil
        blogLabel.text = user.blog
    }
}
