//
//  GithubProfileViewController.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import UIKit
import Combine

class GithubProfileViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet private weak var profileContainerStack: UIStackView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var bioLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var companyLabel: UILabel!
    @IBOutlet private weak var blogLabel: UILabel!
    @IBOutlet private weak var repositoriesCountLabel: UILabel!
    
    private let viewModel = GithubProfileViewModel()
    
    private var cancellables = Set<AnyCancellable>()
    
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
        
        let cancellable = viewModel
            .userSubject
            .sink(receiveValue: { [weak self] userViewModel in
                self?.display(userViewModel)
            })
        
        cancellables.insert(cancellable)
    }
    
    private func fetchProfile() {
        activityIndicator.startAnimating()
        profileContainerStack.isHidden = true
        
        viewModel.fetchProfile()
    }
    
    private func display(_ user: UserViewModel) {
        activityIndicator.stopAnimating()
        profileContainerStack.isHidden = false
        
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
