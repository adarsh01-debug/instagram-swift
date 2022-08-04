//
//  HomeViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Outlets
    
    @IBOutlet var storyCollectionView: UICollectionView!
    @IBOutlet var feedCollectionView: UICollectionView!
    
    // MARK: - Variables
    
    let storyKCellIdentifier = "StoryCollectionViewCell"
    let feedKCellIdentifier = "FeedCollectionViewCell"
    
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCustomViewInCell()
        
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
    }
    
    func registerCustomViewInCell() {
        let nib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        storyCollectionView.register(nib, forCellWithReuseIdentifier: storyKCellIdentifier)
        
        let newNib = UINib(nibName: "FeedCollectionViewCell", bundle: nil)
        feedCollectionView.register(newNib, forCellWithReuseIdentifier: feedKCellIdentifier)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == storyCollectionView {
            return 10
        } else if collectionView == feedCollectionView {
            return 10
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == storyCollectionView {
            guard let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: storyKCellIdentifier, for: indexPath) as? StoryCollectionViewCell else {
                return UICollectionViewCell()
            }
//            cell.storyImage.layer.masksToBounds = true
//            cell.storyImage.layer.cornerRadius = 50.0
            
//            cell.storyImage.makeRoundCorners(byRadius: 43)
            
            // Configure the cell
            cell.storyImage.layer.borderWidth = 1
            cell.storyImage.layer.masksToBounds = false
            cell.storyImage.layer.borderColor = UIColor.black.cgColor
            cell.storyImage.layer.cornerRadius = cell.storyImage.frame.height / 2
            cell.storyImage.clipsToBounds = true
            
//            cell.storyImage.image = UIImage(systemName: "person.fill")
            cell.storyName.text = "Adarsh"
            return cell
            
        } else if collectionView == feedCollectionView {
            guard let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: feedKCellIdentifier, for: indexPath) as? FeedCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            // Configure the cell
            cell.userProfileImage.layer.borderWidth = 0.5
            cell.userProfileImage.layer.masksToBounds = false
            cell.userProfileImage.layer.borderColor = UIColor.black.cgColor
            cell.userProfileImage.layer.cornerRadius = cell.userProfileImage.frame.height / 2
            cell.userProfileImage.clipsToBounds = true
            
            cell.userName.text = "Adarsh"
            cell.post.contentMode = .scaleToFill
            cell.userNameTwo.text = "Adarsh"
            cell.caption.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == storyCollectionView {
            return CGSize(width: storyCollectionView.bounds.height, height: storyCollectionView.bounds.height)
        } else if collectionView == feedCollectionView {
            return CGSize(width: feedCollectionView.bounds.width , height: feedCollectionView.bounds.height)
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

}

extension UIImageView {
   func makeRoundCorners(byRadius rad: CGFloat) {
      self.layer.cornerRadius = rad
      self.clipsToBounds = true
   }
}
