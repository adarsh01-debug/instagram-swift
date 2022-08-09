//
//  RegistrationViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    var genderResult: String?
    var accountTypeResult: String?
    var interestsResult: [String] = []

    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var maleRadioButton: UIButton!
    @IBOutlet var maleLabel: UILabel!
    @IBOutlet var femaleRadioButton: UIButton!
    @IBOutlet var femaleLabel: UILabel!
    @IBOutlet var accountTypeLabel: UILabel!
    @IBOutlet var bussinessRadioButton: UIButton!
    @IBOutlet var bussinessLabel: UILabel!
    @IBOutlet var personalRadioButton: UIButton!
    @IBOutlet var personalLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var technologyCheckBox: UIButton!
    @IBOutlet var technologyLabel: UILabel!
    @IBOutlet var foodCheckBox: UIButton!
    @IBOutlet var foodLabel: UILabel!
    @IBOutlet var sportsCheckBox: UIButton!
    @IBOutlet var sportsLabel: UILabel!
    @IBOutlet var musicCheckBox: UIButton!
    @IBOutlet var musicLabel: UILabel!
    @IBOutlet var gamingCheckBox: UIButton!
    @IBOutlet var gamingLabel: UILabel!
    @IBOutlet var signUpOutlet: UIButton!
    
    
    @IBAction func genderAction(_ sender: Any) {
        if (sender as AnyObject).tag == 1 {
            maleRadioButton.isSelected = true
            femaleRadioButton.isSelected = false
            
            maleRadioButton.setImage(UIImage(systemName: "record.circle"), for: .normal)
            femaleRadioButton.setImage(UIImage(systemName: "circlebadge"), for: .normal)
            genderResult = "Male"
        } else if (sender as AnyObject).tag == 2 {
            femaleRadioButton.isSelected = true
            maleRadioButton.isSelected = false
            
            femaleRadioButton.setImage(UIImage(systemName: "record.circle"), for: .normal)
            maleRadioButton.setImage(UIImage(systemName: "circlebadge"), for: .normal)
            genderResult = "Female"
        }
    }
    
    @IBAction func accountTypeAction(_ sender: Any) {
        if (sender as AnyObject).tag == 3 {
            bussinessRadioButton.isSelected = true
            personalRadioButton.isSelected = false
            
            bussinessRadioButton.setImage(UIImage(systemName: "record.circle"), for: .normal)
            personalRadioButton.setImage(UIImage(systemName: "circlebadge"), for: .normal)
            accountTypeResult = "Bussiness"
        } else if (sender as AnyObject).tag == 4 {
            personalRadioButton.isSelected = true
            bussinessRadioButton.isSelected = false
            
            personalRadioButton.setImage(UIImage(systemName: "record.circle"), for: .normal)
            bussinessRadioButton.setImage(UIImage(systemName: "circlebadge"), for: .normal)
            accountTypeResult = "Personal"
        }
    }
    
    
    @IBAction func techonologyCheckBoxAction(_ sender: Any) {
        if (sender as AnyObject).isSelected {
            technologyCheckBox.isSelected = false
            technologyCheckBox.setImage(UIImage(systemName: "square"), for: .normal)
            
            if ((interestsResult.contains("Technology")) == true) {
                let index = interestsResult.firstIndex(of: "Technology")!
                interestsResult.remove(at: index)
            }
            print(interestsResult)
        } else {
            technologyCheckBox.isSelected = true
            technologyCheckBox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            interestsResult.append("Technology")
            print(interestsResult)
        }
    }
    
    @IBAction func foodCheckBoxAction(_ sender: Any) {
        if (sender as AnyObject).isSelected {
            foodCheckBox.isSelected = false
            foodCheckBox.setImage(UIImage(systemName: "square"), for: .normal)
            
            if ((interestsResult.contains("Food")) == true) {
                let index = interestsResult.firstIndex(of: "Food")!
                interestsResult.remove(at: index)
            }
            print(interestsResult)
        } else {
            foodCheckBox.isSelected = true
            foodCheckBox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            interestsResult.append("Food")
            print(interestsResult)
        }
    }
    
    @IBAction func sportsCheckBoxAction(_ sender: Any) {
        if (sender as AnyObject).isSelected {
            sportsCheckBox.isSelected = false
            sportsCheckBox.setImage(UIImage(systemName: "square"), for: .normal)
            
            if ((interestsResult.contains("Sports")) == true) {
                let index = interestsResult.firstIndex(of: "Sports")!
                interestsResult.remove(at: index)
            }
            print(interestsResult)
        } else {
            sportsCheckBox.isSelected = true
            sportsCheckBox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            interestsResult.append("Sports")
            print(interestsResult)
        }
    }
    
    
    @IBAction func musicCheckBoxAction(_ sender: Any) {
        if (sender as AnyObject).isSelected {
            musicCheckBox.isSelected = false
            musicCheckBox.setImage(UIImage(systemName: "square"), for: .normal)
            
            if ((interestsResult.contains("Music")) == true) {
                let index = interestsResult.firstIndex(of: "Music")!
                interestsResult.remove(at: index)
            }
            print(interestsResult)
        } else {
            musicCheckBox.isSelected = true
            musicCheckBox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            interestsResult.append("Music")
            print(interestsResult)
        }
    }
    
    
    @IBAction func gamingCheckBoxAction(_ sender: Any) {
        if (sender as AnyObject).isSelected {
            gamingCheckBox.isSelected = false
            gamingCheckBox.setImage(UIImage(systemName: "square"), for: .normal)
            
            if ((interestsResult.contains("Gaming")) == true) {
                let index = interestsResult.firstIndex(of: "Gaming")!
                interestsResult.remove(at: index)
            }
            print(interestsResult)
        } else {
            gamingCheckBox.isSelected = true
            gamingCheckBox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            interestsResult.append("Gaming")
            print(interestsResult)
        }
    }
    
    
    @IBAction func signUpAction(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        genderLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        accountTypeLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        categoryLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        maleLabel.textColor = .gray
        femaleLabel.textColor = .gray
        bussinessLabel.textColor = .gray
        personalLabel.textColor = .gray
        technologyLabel.textColor = .gray
        foodLabel.textColor = .gray
        sportsLabel.textColor = .gray
        musicLabel.textColor = .gray
        gamingLabel.textColor = .gray
        
        signUpOutlet.layer.masksToBounds = true
        signUpOutlet.layer.cornerRadius = 8.0
        signUpOutlet.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
    }

}
