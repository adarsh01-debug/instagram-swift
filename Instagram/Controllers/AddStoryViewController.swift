//
//  AddStoryViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 09/08/22.
//

import UIKit
import FirebaseStorage

class AddStoryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Outlets
    
    @IBOutlet var storyImage: UIImageView!
    @IBOutlet var choosePhotoButtonOutlet: UIButton!
    @IBOutlet var shareButtonOutlet: UIButton!
    
    // MARK: - Variables
    
    let storageRef = Storage.storage().reference()
    var isImageSelected: Bool = false
    var loggedInUser: UserModel?
    var userId: String?
    var loginTemp = LoginTemp()
    var imageUrl: String?
    
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
            if let _ = self.storyImage.image?.jpegData(compressionQuality: 0.7), let userId = self.userId, let imageUrl = self.imageUrl {
                let stringURL = "http://10.20.4.157:9011/story/add-story"
                guard let url = URL(string: stringURL) else {
                    print("Problem in url string")
                    return
                }
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                let body: [String: AnyHashable] = [
                    "url": imageUrl,
                    "userId": userId
                ]

                request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

                let task = URLSession.shared.dataTask(with: request) {data, _, error in
                    if (error != nil) {
                        print("Error in session")
                        return
                    }
                }
                task.resume()
            }
        }
        if !isImageSelected {
            self.dismiss(animated: true, completion: nil)
        }
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
                let imageRef = storageRef.child("image")
                           let imageData : Data = image.pngData()!
                           imageRef.putData(imageData,metadata: nil, completion: {_, error in
                               guard error == nil else {
                                print(error.debugDescription)
                                   print("Failed to upload")
                                   return
                               }
                           })
                           imageRef.downloadURL(completion: {url, error in
                               guard let url = url , error == nil else {
                                   return
                               }
                                let urlString = url.absoluteString
                                print("image URL: ", urlString)
                                self.imageUrl = urlString
                           })
                           isImageSelected = true
                       } else {
                           print("Error")
            }
        self.dismiss(animated: true, completion: nil)
    }
}
