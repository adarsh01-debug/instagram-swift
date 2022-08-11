//
//  AddStoryViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 09/08/22.
//

import UIKit
import MultipartForm

class AddStoryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Outlets
    
    @IBOutlet var storyImage: UIImageView!
    @IBOutlet var choosePhotoButtonOutlet: UIButton!
    @IBOutlet var shareButtonOutlet: UIButton!
    
    // MARK: - Variables
    
    var isImageSelected: Bool = false
    var loggedInUser: UserModel?
    var userId: String?
    var loginTemp = LoginTemp()
    
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
        if isImageSelected {
            if let imageData = self.storyImage.image?.jpegData(compressionQuality: 0.7), let loggedInUser = self.loggedInUser, let userId = self.userId {
                let form = MultipartForm(parts: [
                    MultipartForm.Part(name: "file", data: imageData, filename: "image_from_ios.png", contentType: "image/png"),
                    MultipartForm.Part(name: "date", value: Date.getCurrentDate()),
                    MultipartForm.Part(name: "userId", value: userId),
                    MultipartForm.Part(name: "userName", value: loggedInUser.name!)
                ])
                if let url = URL(string: "http://10.20.4.157:9014/post/add-post") {
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.setValue(form.contentType, forHTTPHeaderField: "Content-Type")
                    let session = URLSession(configuration: .default)
                    let task = session.uploadTask(with: request, from: form.bodyData)
                    task.resume()
                }
            }
        }
        if !isImageSelected {
            self.dismiss(animated: true, completion: nil)
            
        }
            self.storyImage.image = nil
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
            isImageSelected = true
        } else {
            print("Error")
        }
        
        self.dismiss(animated: true, completion: nil)
    }

}
