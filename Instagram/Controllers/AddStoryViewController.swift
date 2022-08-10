//
//  AddStoryViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 09/08/22.
//

import UIKit

class AddStoryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Outlets
    
    @IBOutlet var storyImage: UIImageView!
    @IBOutlet var choosePhotoButtonOutlet: UIButton!
    @IBOutlet var shareButtonOutlet: UIButton!
    
    // MARK: - Actions
    
    
    @IBAction func choosePhotoButtonAction(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true) {
            
        }
    }
    
    
    @IBAction func shareButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            storyImage.image = image
        } else {
            print("Error")
        }
        
        self.dismiss(animated: true, completion: nil)
    }

}
