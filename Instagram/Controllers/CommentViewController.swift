//
//  CommentViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 08/08/22.
//

import UIKit

class CommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet var commentTableView: UITableView!
    
    // MARK: - Variables
    let kCellIdentifier = "CommentTableViewCell"
    let commentModel: [CommentModel] = [
        CommentModel(profilePic: "https://images.unsplash.com/photo-1492528491602-a42e1caf03ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", username: "adarsh.not.found", comment: "Awesome pic"),
        CommentModel(profilePic: "https://images.unsplash.com/photo-1492528491602-a42e1caf03ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", username: "bored_now", comment: "awweieiieee"),
        CommentModel(profilePic: "https://images.unsplash.com/photo-1492528491602-a42e1caf03ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", username: "who_am_i", comment: "nyc pic dear ;)"),
        CommentModel(profilePic: "https://images.unsplash.com/photo-1492528491602-a42e1caf03ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", username: "jhonny.test", comment: "free tonight?"),
        CommentModel(profilePic: "https://images.unsplash.com/photo-1492528491602-a42e1caf03ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", username: "say_my_name", comment: "lol nerd"),
        CommentModel(profilePic: nil, username: "lmao.rofl", comment: "why am i seeing this pic?")
    ]
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCustomViewInCell()
        commentTableView.delegate = self
        commentTableView.dataSource = self
    }
    
    func registerCustomViewInCell() {
        let nib = UINib(nibName: "CommentTableViewCell", bundle: nil)
        commentTableView.register(nib, forCellReuseIdentifier: kCellIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as? CommentTableViewCell else {
            print("Failed to create the custom cell")
            return UITableViewCell()
        }
        let data = commentModel[indexPath.row]
        if let profileUrl = data.profilePic {
            cell.commentorProfilePic.load(url: URL(string: profileUrl)!)
        } else {
            cell.commentorProfilePic.image = UIImage(systemName: "person")
        }
        cell.commentorUsername.text = data.username
        cell.comment.text = data.comment
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}
