//
//  CameraViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    // MARK: - Outlets
    
    @IBOutlet var imageUpload: UIImageView!
    @IBOutlet var captionField: UITextField!
    @IBOutlet var uploadButtonOutlet: UIButton!
    
    // MARK: - Actions
    
    @IBAction func choosePhotoButton(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true) {
            
        }
    }
    
    @IBAction func uploadButton(_ sender: Any) {
    }
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        uploadButtonOutlet.layer.masksToBounds = true
        uploadButtonOutlet.layer.cornerRadius = 8.0
        uploadButtonOutlet.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageUpload.image = image
        } else {
            print("Error")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
