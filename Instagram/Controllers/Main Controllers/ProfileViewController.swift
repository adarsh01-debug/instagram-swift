//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UserPostsDelegate {

    // MARK: - Outlets
    
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var numberOfPosts: UILabel!
    @IBOutlet var numberOfFollowers: UILabel!
    @IBOutlet var numberOfFollowing: UILabel!
    @IBOutlet var editProfileButtonOutlet: UIButton!
    @IBOutlet var userName: UILabel!
    @IBOutlet var bio: UILabel!
    @IBOutlet var postsCollectionView: UICollectionView!
    
    
    // MARK: - Variables
    
    var loggedInUser: UserModel?
    var userId: String?
    var userNamee: String?
    var getUserPostsAPI = GetUserPostsAPI()
    var postModel: [PostModel]?
    
    // MARK: - functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCustomViewInCell()
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
        getUserPostsAPI.delegate = self
        getUserPostsAPI.fecthUserPostsDetails(userId!)
        userName.text = userNamee
    }
    
    func registerCustomViewInCell() {
        let nib = UINib(nibName: "ProfilePostCollectionViewCell", bundle: nil)
        postsCollectionView.register(nib, forCellWithReuseIdentifier: "ProfilePostCollectionViewCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == postsCollectionView {
            return 10
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == postsCollectionView {
            guard let cell = postsCollectionView.dequeueReusableCell(withReuseIdentifier: "ProfilePostCollectionViewCell", for: indexPath) as? ProfilePostCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            // Configure the cell
            if postModel != nil {
                //print("postURL", postModel?[indexPath.row].postURL)
                cell.postImage.load(url: URL(string: (postModel?[indexPath.row].postURL)!)!)
            }
            
            //cell.postImage.image
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: postsCollectionView.bounds.height, height: postsCollectionView.bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func getUserPosts(posts: [PostModel]) {
        DispatchQueue.main.async {
            self.postModel = posts
        }
    }

}
