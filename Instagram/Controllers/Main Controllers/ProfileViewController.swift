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
    
    // MARK: - Actions
    
    
    @IBAction func editProfileAction(_ sender: Any) {
        if let editProfileViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EditProfileViewController") as? EditProfileViewController, let userId = self.userId {
            editProfileViewController.userId = userId
            self.present(editProfileViewController, animated: true, completion: nil)
        }
    }
    
    
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
        userName.text = userNamee
        postsCollectionView.delegate = self
        postsCollectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getUserPostsAPI.fecthUserPostsDetails(userId!)
    }
    
    func registerCustomViewInCell() {
        let nib = UINib(nibName: "ProfilePostCollectionViewCell", bundle: nil)
        postsCollectionView.register(nib, forCellWithReuseIdentifier: "ProfilePostCollectionViewCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let postModel = self.postModel {
            return postModel.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == postsCollectionView {
            guard let cell = postsCollectionView.dequeueReusableCell(withReuseIdentifier: "ProfilePostCollectionViewCell", for: indexPath) as? ProfilePostCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            // Configure the cell
            if let postModel = self.postModel {
                if let url = URL(string: (postModel[indexPath.row].postURL!)) {
                    cell.postImage.load(url: url)
                }
            }
           // cell.postImage.image
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func getUserPosts(posts: [PostModel]) {
        DispatchQueue.main.async {
            self.postModel = posts
            self.postsCollectionView.reloadData()
        }
    }

}
