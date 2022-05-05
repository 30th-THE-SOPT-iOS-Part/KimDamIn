//
//  HomeTabViewController.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/05.
//

import UIKit

class HomeTabViewController: UIViewController {

    @IBOutlet weak var addUIButton: UIButton!
    @IBOutlet weak var likeUIButton: UIButton!
    @IBOutlet weak var shareUIButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    @IBAction func addBtnDidTap(_ sender: Any) {
    }
    @IBAction func likeBtnDidTap(_ sender: Any) {
    }
    @IBAction func shareBtnDidTap(_ sender: Any) {
    }
    
   

}
