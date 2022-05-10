//
//  MainTabViewController.swift
//  iOS_assignment2
//
//  Created by 김담인 on 2022/04/17.
//

import UIKit

class MainTabViewController: UITabBarController, UITabBarControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        guard let reelsVC = UIStoryboard(name: "ReelsTab", bundle: nil).instantiateViewController(withIdentifier: "ReelsTabViewController") as? ReelsTabViewController else {return}
        
        tabBarController(self, didSelect: reelsVC)
    }
    
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
                
       selectedIndex == 2 ?

           (
            tabBar.backgroundColor = .black,
           tabBar.barTintColor = .black,
           tabBar.tintColor = .white,
           tabBar.unselectedItemTintColor = .white
           )
        :
           (
            tabBar.backgroundColor = .white,
           tabBar.barTintColor = .white,
           tabBar.tintColor = .black,
           tabBar.unselectedItemTintColor = .black
           )
    }
    
}


    

