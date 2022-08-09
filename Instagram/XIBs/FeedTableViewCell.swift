//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by Adarsh Pandey on 06/08/22.
//

import UIKit
import AVFoundation

class FeedTableViewCell: UITableViewCell {
    
    var avPLayer: AVPlayer?
    var isPaused: Bool = true
    var isLiked: Bool = false
    var isDisliked: Bool = false
    var isViewMore: Bool = true
    var url: String?
    var delegate: CommentsDelegate?
    var postDelegate: PostDetailDelegate?

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
    @IBOutlet var videoLayer: UIView!
    @IBOutlet var player: UIView!
    @IBOutlet var playPause: UIButton!
    @IBOutlet var viewMoreOutlet: UIButton!
    
    // MARK: - Actions
    @IBAction func playPauseAction(_ sender: Any) {
        if isPaused {
            self.avPLayer?.play()
            playPause.setImage(UIImage(systemName: "pause.fill"), for: UIControl.State.normal)
            isPaused = false
        } else {
            self.avPLayer?.pause()
            playPause.setImage(UIImage(systemName: "play.fill"), for: UIControl.State.normal)
            isPaused = true
        }
    }
    
    @IBAction func likeButtonAction(_ sender: Any) {
        if isLiked {
            likeButtonOutlet.setImage(UIImage(systemName: "hand.thumbsup"), for: UIControl.State.normal)
            isLiked = false
        } else {
            likeButtonOutlet.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: UIControl.State.normal)
            dislikeButtonOutlet.setImage(UIImage(systemName: "hand.thumbsdown"), for: UIControl.State.normal)
            isLiked = true
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
        //let url = URL(string: "https://content.jwplatform.com/manifests/vM7nH0Kl.m3u8")!
        
        if let url = self.url {
            print(url)
            self.avPLayer = AVPlayer(playerItem: AVPlayerItem(url: URL(string: url)!))
            let avPlayerLayer = AVPlayerLayer(player: avPLayer)
            avPlayerLayer.frame = player.bounds
            player.layer.insertSublayer(avPlayerLayer, at: 0)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
