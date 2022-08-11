//
//  ViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, CheckValidation, UserIdDelegate {

    // MARK: - Outlets
    
    @IBOutlet var logo: UIImageView!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginOutlet: UIButton!
    @IBOutlet var signUpOutlet: UIButton!
    
    // MARK: - Variables
    
    let loginAPI = LoginAPI()
    var loggedInUser: UserModel?
    var token: String?
    var userId: String?
    var loginTemp = LoginTemp()
    
    // MARK: - Actions
    
    @IBAction func loginAction(_ sender: Any) {
        if let user = usernameField.text, let password = passwordField.text {
            loginAPI.postLogInData(id: user, password: password)
        } else {
            print("Either username or password is nil")
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        if let registrationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegistrationViewController") as? RegistrationViewController {
            navigationController?.pushViewController(registrationViewController, animated: true)
        }
    }
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginOutlet.layer.masksToBounds = true
        loginOutlet.layer.cornerRadius = 8.0
        loginOutlet.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        signUpOutlet.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        loginAPI.delegate = self
        usernameField.delegate = self
        passwordField.delegate = self
        passwordField.isSecureTextEntry = true
        
        usernameField.text = "adarsh@google.com"
        passwordField.text = "Adarsh@1"
        
        loginTemp.delegate = self
    }
    
    func sendToken(token: String) {
        DispatchQueue.main.async {
            self.token = token
        }
    }
    
    func sendStatus(status: Bool) {
        DispatchQueue.main.async {
            if status, let mainTabViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainTabViewController") as? MainTabViewController {
                mainTabViewController.loggedInUser = self.loggedInUser
                //mainTabViewController.userId = userId
                self.navigationController?.pushViewController(mainTabViewController, animated: true)
            } else {
                let alert = UIAlertController(title: "Alert!", message: "Email or Password you entered is incorrect", preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func sendUser(user: UserModel) {
        DispatchQueue.main.async {
            self.loggedInUser = user
            self.loginTemp.fecthUserDetails(email: (self.loggedInUser?.email)!)
        }
    }
    
    func getUserId(userId: String) {
        DispatchQueue.main.async {
            print("userid from view controller ", userId)
            self.userId = userId
        }
    }
}

