//
//  SignInViewController.swift
//  iOS_assignment1
//
//  Created by 김담인 on 2022/04/07.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var welcomeMessage1: UILabel!
    @IBOutlet weak var welcomeMessage2: UILabel!
    @IBOutlet weak var subMessage: UILabel!
    @IBOutlet weak var signInDoneUIButton: UIButton!
    
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = userName
        userNameLabel.font = .boldSystemFont(ofSize: 20)
        subMessage.sizeToFit()

        welcomeMessage1.text = "instagram에"
        welcomeMessage1.font = .boldSystemFont(ofSize: 20)
        welcomeMessage2.text = "오신 것을 환영합니다."
        welcomeMessage2.font = .boldSystemFont(ofSize: 20)
        
        subMessage.text = "언제든지 연락처 정보와 사용자 이름을 변경할 수 있습니다."
        subMessage.sizeToFit()
        
        signInDoneUIButton.backgroundColor = .systemBlue
        signInDoneUIButton.setTitle("완료하기", for: .normal)
        signInDoneUIButton.setTitleColor(.white, for: .normal)
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
