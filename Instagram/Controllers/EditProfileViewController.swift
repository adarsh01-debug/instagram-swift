//
//  EditProfileViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 08/08/22.
//

import UIKit
import FirebaseStorage

class EditProfileViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    

    // MARK: - Outlets
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var bioField: UITextField!
    @IBOutlet var toggleAccountType: UIButton!
    @IBOutlet var saveOutlet: UIButton!
    
    // MARK: - Variables
    
    var isPrivate: Bool = false
    let storageRef = Storage.storage().reference()
    var isImageSelected: Bool = false
    var imageUrl: String?
    var userId: String?
    
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
        if isImageSelected {
            if let _ = self.profileImage.image?.jpegData(compressionQuality: 0.7), let userId = self.userId, let imageUrl = self.imageUrl, let name = nameField.text, let bio = bioField.text {
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
                    "userId": userId,
                    "name": name,
                    "bio": bio
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
        if !isImageSelected || nameField.text == "" || bioField.text == "" {
            // show alert
        }
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
        nameField.delegate = self
        bioField.delegate = self
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                profileImage.image = image
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
