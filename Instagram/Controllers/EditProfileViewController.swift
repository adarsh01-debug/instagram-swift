//
//  EditProfileViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 08/08/22.
//

import UIKit

class EditProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var isPrivate: Bool = false

    // MARK: - Outlets
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var bioField: UITextField!
    @IBOutlet var toggleAccountType: UIButton!
    @IBOutlet var saveOutlet: UIButton!
    
    
    // MARK: - Actions
    
    @IBAction func toggleAccountTypeAction(_ sender: Any) {
        if isPrivate {
            toggleAccountType.setTitle("Switch to private account", for: .normal)
            isPrivate = false
        } else {
            toggleAccountType.setTitle("Switch to public account", for: .normal)
            isPrivate = true
        }
    }
    
    @IBAction func changeProfilePhotoAction(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true) {
            
        }
    }
    
    @IBAction func saveAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileImage.layer.borderWidth = 0.5
        profileImage.layer.borderColor = UIColor.gray.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        
        saveOutlet.layer.masksToBounds = true
        saveOutlet.layer.cornerRadius = 8.0
        saveOutlet.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.image = image
        } else {
            print("Error")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
