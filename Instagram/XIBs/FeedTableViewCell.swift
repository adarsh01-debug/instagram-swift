//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by Adarsh Pandey on 06/08/22.
//

import UIKit
import AVFoundation

class FeedTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var caption: UILabel!
    @IBOutlet var likeButtonOutlet: UIButton!
    @IBOutlet var dislikeButtonOutlet: UIButton!
    @IBOutlet var commentButtonOutlet: UIButton!
    @IBOutlet var shareButtonOutlet: UIButton!
    @IBOutlet var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet var viewMoreOutlet: UIButton!
    
    // MARK: - Variables
    
    var avPLayer: AVPlayer?
    var isPaused: Bool = true
    var isLiked: Bool = false
    var isDisliked: Bool = false
    var isViewMore: Bool = true
    var delegate: CommentsDelegate?
    var postDelegate: PostDetailDelegate?
    var userId: String?
    var postId: String?
    
    // MARK: - Actions
    
    @IBAction func likeButtonAction(_ sender: Any) {
        if isLiked {
            likeButtonOutlet.setImage(UIImage(systemName: "hand.thumbsup"), for: UIControl.State.normal)
            isLiked = false
        } else {
            likeButtonOutlet.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: UIControl.State.normal)
            dislikeButtonOutlet.setImage(UIImage(systemName: "hand.thumbsdown"), for: UIControl.State.normal)
            isLiked = true
            self.likeAPI()
        }
    }
    
    @IBAction func dislikeButtonAction(_ sender: Any) {
        if isDisliked {
            dislikeButtonOutlet.setImage(UIImage(systemName: "hand.thumbsdown"), for: UIControl.State.normal)
            isDisliked = false
        } else {
            dislikeButtonOutlet.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: UIControl.State.normal)
            likeButtonOutlet.setImage(UIImage(systemName: "hand.thumbsup"), for: UIControl.State.normal)
            isDisliked = true
            self.dislikeAPI()
        }
    }
    
    @IBAction func commentAction(_ sender: Any) {
        self.delegate?.openCommentSection()
    }
    
    @IBAction func viewMoreAction(_ sender: Any) {
        if isViewMore {
            isViewMore = false
            viewMoreOutlet.setTitle("View Less", for: .normal)
            self.postDelegate?.toggleHeight(newHeight: 580)
        } else {
            isViewMore = true
            viewMoreOutlet.setTitle("View More", for: .normal)
            self.postDelegate?.toggleHeight(newHeight: 530)
        }
    }
    
    
    // MARK: - Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userName.font = UIFont.boldSystemFont(ofSize: 16.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func likeAPI() {
         let stringURL = "http://10.20.4.157:9014/post/reaction"
         guard let url = URL(string: stringURL) else {
             print("Problem in url string")
             return
         }
         var request = URLRequest(url: url)
         request.httpMethod = "POST"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         let body: [String: AnyHashable] = [
             "id": self.postId,
             "userId": self.userId,
             "type": "like"
         ]
         request.httpBody = try?JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
         let task = URLSession.shared.dataTask(with: request) {data, _, error in
             if (error != nil){
                 print("Error in session")
                 return
             }
             //self.getPostInfo(postId: self.postId!)
         }
         task.resume()
     }
    
    func dislikeAPI() {
         let stringURL = "http://10.20.4.157:9014/post/reaction"
         guard let url = URL(string: stringURL) else {
             print("Problem in url string")
             return
         }
         var request = URLRequest(url: url)
         request.httpMethod = "POST"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         let body: [String: AnyHashable] = [
             "id": self.postId,
             "userId": self.userId,
             "type": "dislike"
         ]
         request.httpBody = try?JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
         let task = URLSession.shared.dataTask(with: request) {data, _, error in
             if (error != nil){
                 print("Error in session")
                 return
             }
             //self.getPostInfo(postId: self.postId!)
         }
         task.resume()
     }
    
//    func getPostInfo(postId: String){
//            let finalUrl = "http://10.20.4.81:9016/post/get-reactions/\(postId)"
//            if let url = URL(string: finalUrl){
//                let session = URLSession(configuration: .default)
//                let task = session.dataTask(with: url) { [weak self] (data, response, error) in
//                    if (error != nil){
//                        print("error in session")
//                        return
//                    }
//                    if let safeData = data{
//                        print("no error")
//                        if let convertedData = self?.parseJSON(safeData){
//                            DispatchQueue.main.async {
//                                self?.postInfo.text = String(convertedData.likesCount) + "Likes " + String(convertedData.dislikesCount) + "Dislikes"
//                            }
//
//                        }
//                    }
//
//                }
//                task.resume()
//            }else{
//                print("No user to get email from")
//            }
//        }


}
