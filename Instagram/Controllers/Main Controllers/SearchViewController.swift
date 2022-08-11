//
//  SearchViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 04/08/22.
//

import UIKit

class SearchViewController: UIViewController, AdsManagerDelegate {

    // MARK: - Outlets
    
    @IBOutlet var adView: UIView!
    @IBOutlet var adType: UILabel!
    @IBOutlet var adImage: UIImageView!
    
    // MARK: - Variables
    
    var adData: AdModel?
    var adAPI = AdAPI()
    var token: String?
    
    // MARK: - Actions
    
    
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        adAPI.delegate = self
        adType.font = UIFont.boldSystemFont(ofSize: 16.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let token = token {
            adAPI.fetchAd(token)
        }
    }
    
    func getAds(adData: AdModel) {
        DispatchQueue.main.async {
            print(adData)
            self.adData = adData
            self.adType.text = "Ad: \((self.adData?.title)!)"
            
            if let url = URL(string: self.adData!.image) {
                self.adImage.load(url: url)
            }
        }
    }
}
