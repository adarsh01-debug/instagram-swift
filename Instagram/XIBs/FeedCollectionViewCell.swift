//
//  FeedCollectionViewCell.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet var userProfileImage: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var post: UIImageView!
    @IBOutlet var likeOutlet: UIButton!
    @IBOutlet var dislikeOutlet: UIButton!
    @IBOutlet var commentOutlet: UIButton!
    @IBOutlet var userNameTwo: UILabel!
    @IBOutlet var caption: UILabel!
    @IBOutlet var likes: UILabel!
    
    // MARK: - Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userName.font = UIFont.boldSystemFont(ofSize: 16.0)
        userNameTwo.font = UIFont.boldSystemFont(ofSize: 16.0)
        likes.font = UIFont.boldSystemFont(ofSize: 16.0)
    }

}
