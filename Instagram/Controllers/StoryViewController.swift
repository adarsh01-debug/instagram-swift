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
    
    // MARK: - Variables
    
    var imageUrl: String?
    
    // MARK: - Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let imageUrl = self.imageUrl, let url = URL(string: imageUrl) {
            storyImage.load(url: url)
        }
    }

}
