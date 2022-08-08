//
//  HomeViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    
    @IBOutlet var storyCollectionView: UICollectionView!
    @IBOutlet var feedTableView: UITableView!
    
    
    // MARK: - Variables
    
    let storyKCellIdentifier = "StoryCollectionViewCell"
    let feedKCellIdentifier = "FeedTableViewCell"
    
    let postModel: [PostModel] = [
        PostModel(profilePic: "https://images.unsplash.com/photo-1492528491602-a42e1caf03ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", username: "adarsh.not.found", imageURL: "https://i0.wp.com/the-shooting-star.com/wp-content/uploads/2020/03/travel-advice-coronavirus-1.jpg?w=2520&ssl=1", videoURL: nil, caption: nil),
        PostModel(profilePic: "https://images.unsplash.com/photo-1492528491602-a42e1caf03ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", username: "jhonny.test", imageURL: "https://i0.wp.com/the-shooting-star.com/wp-content/uploads/2020/03/travel-advice-coronavirus-1.jpg?w=2520&ssl=1", videoURL: nil, caption: nil),
        PostModel(profilePic: "https://images.unsplash.com/photo-1492528491602-a42e1caf03ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", username: "whats_in_a_name", imageURL: nil, videoURL: nil, caption: nil),
        PostModel(profilePic: "https://images.unsplash.com/photo-1492528491602-a42e1caf03ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", username: "who_am_i", imageURL: nil, videoURL: "https://content.jwplatform.com/manifests/vM7nH0Kl.m3u8", caption: nil),
        PostModel(profilePic: nil, username: "lmao.rofl", imageURL: "https://i0.wp.com/the-shooting-star.com/wp-content/uploads/2020/03/travel-advice-coronavirus-1.jpg?w=2520&ssl=1", videoURL: nil, caption: nil),
        PostModel(profilePic: "https://images.unsplash.com/photo-1492528491602-a42e1caf03ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", username: "say_my_name", imageURL: nil, videoURL: "https://content.jwplatform.com/manifests/vM7nH0Kl.m3u8", caption: nil),
        PostModel(profilePic: "https://images.unsplash.com/photo-1492528491602-a42e1caf03ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", username: "idk.idc", imageURL: "https://i0.wp.com/the-shooting-star.com/wp-content/uploads/2020/03/travel-advice-coronavirus-1.jpg?w=2520&ssl=1", videoURL: nil, caption: nil),
        PostModel(profilePic: "https://images.unsplash.com/photo-1492528491602-a42e1caf03ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", username: "bored_now", imageURL: nil, videoURL: "https://content.jwplatform.com/manifests/vM7nH0Kl.m3u8", caption: nil)
    ]
    
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCustomViewInCell()
        
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
    }
    
    func registerCustomViewInCell() {
        let nib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        storyCollectionView.register(nib, forCellWithReuseIdentifier: storyKCellIdentifier)
        
        let newNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        feedTableView.register(newNib, forCellReuseIdentifier: feedKCellIdentifier)
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
        }
    else {
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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let secondScreenController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondScreenController") as? SecondScreenController {
//
//            secondScreenController.titleLabel = brandData?[indexPath.row].name
//            secondScreenController.priceLabel = brandData?[indexPath.row].price
//            secondScreenController.productTypeLabel = brandData?[indexPath.row].productType
//            secondScreenController.descriptionLabel = brandData?[indexPath.row].welcomeDescription
//            secondScreenController.urlLabel = brandData?[indexPath.row].imageLink
//            secondScreenController.rating = brandData?[indexPath.row].rating
//            secondScreenController.shades = brandData?[indexPath.row].productColours
//            navigationController?.pushViewController(secondScreenController, animated: true)
//        } else {
//            print("Error getitng detail view controller")
//        }
//    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: feedKCellIdentifier, for: indexPath) as? FeedTableViewCell else {
            print("Failed to create the custom cell")
            return UITableViewCell()
        }
        
        let data = postModel[indexPath.row]
        
        cell.profilePic.layer.borderWidth = 0.5
        cell.profilePic.layer.masksToBounds = false
        cell.profilePic.layer.borderColor = UIColor.gray.cgColor
        cell.profilePic.layer.cornerRadius = cell.profilePic.frame.height / 2
        cell.profilePic.clipsToBounds = true
        
        if let profileUrl = data.profilePic {
            cell.profilePic.load(url: URL(string: profileUrl)!)
        } else {
            cell.profilePic.image = UIImage(systemName: "person")
        }
        
        cell.userName.text = data.username
        
        if let postImage = data.imageURL, data.videoURL == nil {
            cell.postImage.load(url: URL(string: postImage)!)
            cell.postImage.contentMode = .scaleToFill
            cell.videoLayer.isHidden = true
        }
        
        if let videoUrl = data.videoURL, data.imageURL == nil {
            cell.url = videoUrl
            cell.imageView?.isHidden = true
            cell.videoLayer.isHidden = false
        }
        
        if data.imageURL == nil, data.videoURL == nil {
            cell.imageView?.isHidden = true
            cell.videoLayer.isHidden = true
        }
        
        //cell.caption.text = data.caption
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if postModel[indexPath.row].imageURL != nil || postModel[indexPath.row].videoURL != nil {
            return 530;
        } else {
            return 230;
        }
    }
}
