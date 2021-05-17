//
//  GithubProfileViewController.swift
//  github-profile
//
//  Created by Tiago Lopes on 16/05/21.
//

import UIKit

class GithubProfileViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet var fetchButton: UIButton!
    private let viewModel = GithubProfileViewModel()
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    
    @IBAction func fetchProfile(_ sender: UIButton) {
        viewModel.fetchProfile()
    }
}
