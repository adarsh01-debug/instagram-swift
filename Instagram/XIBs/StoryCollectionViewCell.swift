//
//  StoryCollectionViewCell.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet var storyName: UILabel!
    @IBOutlet var storyImage: UIImageView!
    
    
    // MARK: - Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        storyName.font = UIFont.boldSystemFont(ofSize: 16.0)
    }

}
