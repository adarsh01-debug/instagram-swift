//
//  StoryViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 08/08/22.
//

import UIKit

class StoryViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet var storyImage: UIImageView!
    @IBOutlet var userName: UILabel!
    // MARK: - Variables
    
    var imageUrl: String?
    var name: String?
    
    // MARK: - Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userName.font = UIFont.boldSystemFont(ofSize: 16.0)
        if let imageUrl = self.imageUrl, let url = URL(string: imageUrl) {
            storyImage.load(url: url)
        }
        if let name = self.name {
            userName.text = "\(name)'s Story"
        }
    }

}
