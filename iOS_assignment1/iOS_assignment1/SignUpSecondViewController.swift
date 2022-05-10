//
//  SignUpSecondViewController.swift
//  iOS_assignment1
//
//  Created by 김담인 on 2022/04/07.
//

import UIKit

class SignUpSecondViewController: UIViewController {

    @IBOutlet weak var signUpSecondTitle: UILabel!
    @IBOutlet weak var signUpSecondSubTitle: UILabel!
    @IBOutlet weak var signUpSecondTextField: UITextField!
    @IBOutlet weak var signUpSecondUIButton: UIButton!
    
    var userName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpSecondTitle.text = "비밀번호 만들기"
        signUpSecondTitle.font = .boldSystemFont(ofSize: 22)
        signUpSecondTitle.sizeToFit()
        
        signUpSecondSubTitle.text = " 비밀번호를 저장할 수 있으므로 iCloud® 기기에서 로그인 정보를 입력하지 않아도 됩니다."
        signUpSecondSubTitle.sizeToFit()
        
        signUpSecondTextField.placeholder = "비밀번호"
        signUpSecondTextField.clearButtonMode = .whileEditing

        
        signUpSecondUIButton.backgroundColor = .tintColor
        signUpSecondUIButton.setTitle("다음", for: .normal)
        signUpSecondUIButton.setTitleColor(.white, for: .normal)
        
        signUpSecondUIButton.isEnabled = false
        
    }
    @IBAction func signUpSeconTextFieldAction(_ sender: Any) {
        if (signUpSecondTextField.text?.isEmpty != nil && signUpSecondTextField.text != "") {
            
            signUpSecondUIButton.isEnabled = true
            
        }else {
            signUpSecondUIButton.isEnabled = false
        }
    }
    
    @IBAction func signUpSecondButton(_ sender: Any) {
        guard let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController else { return }
        signInVC.userName = userName
        
        self.present(signInVC, animated: true)
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
