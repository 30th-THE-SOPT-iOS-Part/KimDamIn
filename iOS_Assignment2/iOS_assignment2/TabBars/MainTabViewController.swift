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
        
//       let tabBarIndex = tabBarController.selectedIndex
        
       if selectedIndex == 2 {
           tabBar.backgroundColor = .black
           tabBar.barTintColor = .blue
           tabBar.tintColor = .white
           tabBar.unselectedItemTintColor = .white
       }else {
           tabBar.backgroundColor = .white
           tabBar.barTintColor = .blue
           tabBar.tintColor = .black
           tabBar.unselectedItemTintColor = .black
       }
    }
    
}
    

