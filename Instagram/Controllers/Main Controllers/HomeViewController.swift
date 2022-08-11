//
//  HomeViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource, CommentsDelegate, PostDetailDelegate, PostManagerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet var storyCollectionView: UICollectionView!
    @IBOutlet var feedTableView: UITableView!
    @IBOutlet var addStoryOutlet: UIButton!
    
    
    // MARK: - Variables
    
    let storyKCellIdentifier = "StoryCollectionViewCell"
    let feedKCellIdentifier = "FeedTableViewCell"
    var postData: [PostModel]?
    let postAPI = FeedAPI()
    var loggedInUser: UserModel?
    var tableRowHeight: Double?
    var userId: String?
    
    // MARK: - Actions
    
    @IBAction func addStoryAction(_ sender: Any) {
        
    }
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCustomViewInCell()
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        feedTableView.delegate = self
        feedTableView.dataSource = self
        postAPI.delegate = self
        feedTableView.rowHeight = UITableView.automaticDimension
        feedTableView.estimatedRowHeight = 50
        addStoryOutlet.layer.borderWidth = 0.5
        addStoryOutlet.layer.masksToBounds = false
        addStoryOutlet.layer.borderColor = UIColor.gray.cgColor
        addStoryOutlet.layer.cornerRadius = addStoryOutlet.frame.height / 2
        addStoryOutlet.clipsToBounds = true
        postAPI.fecthPostDetails()
    }
    
    func registerCustomViewInCell() {
        let nib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        storyCollectionView.register(nib, forCellWithReuseIdentifier: storyKCellIdentifier)
        
        let newNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        feedTableView.register(newNib, forCellReuseIdentifier: feedKCellIdentifier)
    }
    
    func openCommentSection() {
        let commentViewController = self.storyboard?.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        self.present(commentViewController, animated: true, completion: nil)
    }
    
    func toggleHeight(newHeight: Double) {
        print(#function)
        tableRowHeight = newHeight
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == storyCollectionView {
            return 10
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == storyCollectionView {
            guard let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: storyKCellIdentifier, for: indexPath) as? StoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            // Configure the cell
            cell.storyImage.layer.borderWidth = 0.5
            cell.storyImage.layer.masksToBounds = false
            cell.storyImage.layer.borderColor = UIColor.gray.cgColor
            cell.storyImage.layer.cornerRadius = cell.storyImage.frame.height / 2
            cell.storyImage.clipsToBounds = true
            
            cell.storyName.text = "Adarsh"
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == storyCollectionView {
            return CGSize(width: storyCollectionView.bounds.height, height: storyCollectionView.bounds.height)
        } else {
            return CGSize(width: 0.0, height: 0.0)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyViewController = self.storyboard?.instantiateViewController(withIdentifier: "StoryViewController") as! StoryViewController
        self.present(storyViewController, animated: true, completion: nil)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let postData = postData {
            return postData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: feedKCellIdentifier, for: indexPath) as? FeedTableViewCell else {
            print("Failed to create the custom cell")
            return UITableViewCell()
        }
        
        cell.delegate = self
        cell.postDelegate = self
        
        if let postData = postData {
            let data = postData[indexPath.row]
            
            cell.profilePic.layer.borderWidth = 0.5
            cell.profilePic.layer.masksToBounds = false
            cell.profilePic.layer.borderColor = UIColor.gray.cgColor
            cell.profilePic.layer.cornerRadius = cell.profilePic.frame.height / 2
            cell.profilePic.clipsToBounds = true
            
            cell.profilePic.image = UIImage(systemName: "person")
            cell.userName.text = data.name
            
            if let postImage = data.postURL {
                
                cell.postImage.load(url: URL(string: postImage)!)
                cell.postImage.contentMode = .scaleToFill
            } else {
                cell.postImage.isHidden = true
                cell.imageHeightConstraint.constant = 0.0
            }
            
            cell.caption.text = data.caption
            cell.postId = data.id
            cell.userId = data.userID
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let postData = postData {
            if postData[indexPath.row].postURL != nil {
                return 480
            }
        }
        return 230
    }
    
    func updatedData(postData: [PostModel]) {
        DispatchQueue.main.async {
            self.postData = postData
            self.feedTableView.reloadData()
        }
    }
}
