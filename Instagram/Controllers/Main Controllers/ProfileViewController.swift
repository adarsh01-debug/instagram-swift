//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var numberOfPosts: UILabel!
    @IBOutlet var numberOfFollowers: UILabel!
    @IBOutlet var numberOfFollowing: UILabel!
    @IBOutlet var editProfileButtonOutlet: UIButton!
    @IBOutlet var userName: UILabel!
    @IBOutlet var bio: UILabel!
    @IBOutlet var postsCollectionView: UICollectionView!
    
    
    
    // MARK: - functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        numberOfPosts.font = UIFont.boldSystemFont(ofSize: 18.0)
        numberOfFollowers.font = UIFont.boldSystemFont(ofSize: 18.0)
        numberOfFollowing.font = UIFont.boldSystemFont(ofSize: 18.0)
        userName.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        editProfileButtonOutlet.layer.masksToBounds = true
        editProfileButtonOutlet.layer.borderWidth = 0.5
        editProfileButtonOutlet.layer.borderColor = UIColor.gray.cgColor
        editProfileButtonOutlet.layer.cornerRadius = 8.0
        editProfileButtonOutlet.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        profilePic.layer.borderWidth = 0.5
        profilePic.layer.masksToBounds = false
        profilePic.layer.borderColor = UIColor.gray.cgColor
        profilePic.layer.cornerRadius = profilePic.frame.height / 2
        profilePic.clipsToBounds = true
        
    }

}
