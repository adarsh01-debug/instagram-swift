//
//  MainTabViewController.swift
//  Instagram
//
//  Created by Adarsh Pandey on 06/08/22.
//

import UIKit

class MainTabViewController: UITabBarController, UITabBarControllerDelegate {

    
    var loggedInUser: UserModel?
    var userId: String?
    var cameraNavController: UINavigationController?
    var cameraViewController: CameraViewController?
    var homeNavController: UINavigationController?
    var homeViewController: HomeViewController?
    var profileNavController: UINavigationController?
    var profileViewController: ProfileViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarController?.delegate = self
        cameraNavController = self.viewControllers?[2] as? UINavigationController
        cameraViewController = cameraNavController?.topViewController as? CameraViewController
        homeNavController = self.viewControllers?[0] as? UINavigationController
        homeViewController = homeNavController?.topViewController as? HomeViewController
        profileNavController = self.viewControllers?[3] as? UINavigationController
        profileViewController = profileNavController?.topViewController as? ProfileViewController
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("userid from main tab ", self.userId)
        cameraViewController?.loggedInUser = self.loggedInUser
        homeViewController?.userId = self.userId
        profileViewController?.userId = self.userId
    }

}
