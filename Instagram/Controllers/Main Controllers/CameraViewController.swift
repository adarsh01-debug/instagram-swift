//
//  CameraViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit
//import FirebaseStorage
import MultipartForm

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UserIdDelegate {

    // MARK: - Outlets
    
    @IBOutlet var imageUpload: UIImageView!
    @IBOutlet var captionField: UITextField!
    @IBOutlet var uploadButtonOutlet: UIButton!
    
    // MARK: - Variables
    //let storageRef = Storage.storage().reference()
    let data = Data()
    var isImageSelected: Bool = false
    var loggedInUser: UserModel?
    var userId: String?
    var loginTemp = LoginTemp()
    
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
            if let imageData = self.imageUpload.image?.jpegData(compressionQuality: 0.7), let loggedInUser = self.loggedInUser, let userId = self.userId {
                let form = MultipartForm(parts: [
                    MultipartForm.Part(name: "file", data: imageData, filename: "image_from_ios.png", contentType: "image/png"),
                    MultipartForm.Part(name: "caption", value: self.captionField.text ?? ""),
                    MultipartForm.Part(name: "hashtag", value: ""),
                    MultipartForm.Part(name: "date", value: Date.getCurrentDate()),
                    MultipartForm.Part(name: "userId", value: userId),
                    MultipartForm.Part(name: "userName", value: loggedInUser.name!)
                ])
                if let url = URL(string: "http://10.20.4.157:9014/post/add-post"){
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
            if let imageData = UIImage(systemName: "person")?.jpegData(compressionQuality: 0.7), let loggedInUser = self.loggedInUser, let userId = self.userId {
                let form = MultipartForm(parts: [MultipartForm.Part(name: "file", data: imageData, filename: "", contentType: "image/png"),
                    MultipartForm.Part(name: "caption", value: self.captionField.text ?? ""),
                    MultipartForm.Part(name: "hashtag", value: ""),
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
    //            let imageRef = storageRef.child("image")
    //                       let imageData : Data = image.pngData()!
    //                       imageRef.putData(imageData,metadata: nil, completion: {_, error in
    //                           guard error == nil else {
    //                               print("Failed to upload")
    //                               return
    //                           }
    //                       })
    //                       imageRef.downloadURL(completion: {url, error in
    //                           guard let url = url , error == nil else {
    //                               return
    //                           }
    //                           let urlString = url.absoluteString
    //                           print(urlString)
    //                       })
    //                       isImageSelected = true
    //                   } else {
    //                       print("Error")
    //        }
    //
            self.dismiss(animated: true, completion: nil)
        }
    }
        
    func getUserId(userId: String) {
        DispatchQueue.main.async {
            print(userId)
            self.userId = userId
        }
    }
}
