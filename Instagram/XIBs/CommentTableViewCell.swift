//
//  CommentTableViewCell.swift
//  Instagram
//
//  Created by Adarsh Pandey on 08/08/22.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet var commentorUsername: UILabel!
    @IBOutlet var commentorProfilePic: UIImageView!
    @IBOutlet var comment: UILabel!
    
    // MARK: - Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        commentorUsername.font = UIFont.boldSystemFont(ofSize: 16.0)
        commentorProfilePic.layer.borderWidth = 0.5
        commentorProfilePic.layer.masksToBounds = false
        commentorProfilePic.layer.borderColor = UIColor.gray.cgColor
        commentorProfilePic.layer.cornerRadius = commentorProfilePic.frame.height / 2
        commentorProfilePic.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
