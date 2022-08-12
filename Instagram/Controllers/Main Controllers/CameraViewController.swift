//
//  CameraViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit
import FirebaseStorage
import MultipartForm

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UserIdDelegate {

    // MARK: - Outlets
    @IBOutlet var imageUpload: UIImageView!
    @IBOutlet var captionField: UITextField!
    @IBOutlet var uploadButtonOutlet: UIButton!
    
    // MARK: - Variables
    let storageRef = Storage.storage().reference()
    let data = Data()
    var loggedInUser: UserModel?
    var userId: String?
    var loginTemp = LoginTemp()
    var isImageSelected: Bool = false
    var imageUrl: String?
    
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
        if isImageSelected {
            if let _ = self.imageUpload.image?.jpegData(compressionQuality: 0.7), let loggedInUser = self.loggedInUser, let userId = self.userId, let imageUrl = self.imageUrl {
                let stringURL = "http://10.20.4.157:9014/post/add-post"
                guard let url = URL(string: stringURL) else {
                    print("Problem in url string")
                    return
                }
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                let body: [String: AnyHashable] = [
                    "postUrl": imageUrl,
                    "caption": self.captionField.text ?? "",
                    "hashtag": "",
                    "date": Date.getCurrentDate(),
                    "userId": userId,
                    "userName": loggedInUser.name
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
            if let _ = UIImage(systemName: "person")?.jpegData(compressionQuality: 0.7), let loggedInUser = self.loggedInUser, let userId = self.userId {
                let stringURL = "http://10.20.4.157:9014/post/add-post"
                guard let url = URL(string: stringURL) else {
                    print("Problem in url string")
                    return
                }
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                let body: [String: AnyHashable] = [
                    "postUrl": "",
                    "caption": self.captionField.text ?? "",
                    "hashtag": "",
                    "date": Date.getCurrentDate(),
                    "userId": userId,
                    "userName": loggedInUser.name
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
            self.captionField.text = nil
            self.imageUpload.image = nil
        }
    }
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        uploadButtonOutlet.layer.masksToBounds = true
        uploadButtonOutlet.layer.cornerRadius = 8.0
        uploadButtonOutlet.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        captionField.text = "New pic uploadinggg!!!!"
        loginTemp.delegate = self
        loginTemp.fecthUserDetails(email: (loggedInUser?.email)!)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imageUpload.image = image
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
        
    func getUserId(userId: String) {
        DispatchQueue.main.async {
            print(userId)
            self.userId = userId
        }
    }
}
