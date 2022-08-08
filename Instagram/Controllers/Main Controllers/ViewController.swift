//
//  ViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet var logo: UIImageView!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginOutlet: UIButton!
    @IBOutlet var signUpOutlet: UIButton!
    
    // MARK: - Actions
    
    @IBAction func loginAction(_ sender: Any) {
        if let mainTabViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainTabViewController") as? MainTabViewController {
            navigationController?.pushViewController(mainTabViewController, animated: true)
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
    }
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginOutlet.layer.masksToBounds = true
        loginOutlet.layer.cornerRadius = 8.0
        loginOutlet.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        signUpOutlet.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        
    }


}

