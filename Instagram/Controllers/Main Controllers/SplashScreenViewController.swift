//
//  SplashScreenViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 06/08/22.
//

import UIKit

class SplashScreenViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var splashGif: UIImageView!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let gif = UIImage.gifImageWithName("splachScreen")
        let imageView = UIImageView(image: gif)
        imageView.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height - 100)
        view.addSubview(imageView)
        
    }

}
