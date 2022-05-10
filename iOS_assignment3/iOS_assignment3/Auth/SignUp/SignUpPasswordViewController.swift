//
//  SignUpPasswordViewController.swift
//  iOS_assignment2
//
//  Created by 김담인 on 2022/04/16.
//

import UIKit

final class SignUpPasswordViewController: UIViewController {
    
    //MARK: - Property
    
    var userName:String?
    
    //MARK: - IBOulet
    
    @IBOutlet weak var passwordUITextField: UITextField!
    @IBOutlet weak var goToNextUIButton: UIButton!
    @IBOutlet weak var passwordMaskUIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        setNextButton()
    }
    //MARK: - Function
    
    func setTextField() {
        passwordUITextField.placeholder = "비밀번호"
        passwordUITextField.clearButtonMode = .whileEditing
        passwordUITextField.isSecureTextEntry = true
        passwordMaskUIButton.setImage(UIImage(named: "icn_password_hidden"), for: .normal)
    }
    
    func setNextButton() {
        goToNextUIButton.setTitle("다음", for: .normal)
        goToNextUIButton.setTitleColor(.white, for: .normal)
        goToNextUIButton.isEnabled = false
    }
    
    //MARK: - IBAction
    
    @IBAction func navBarBackButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func passwordMaskButtonDidTap(_ sender: Any) {
        passwordUITextField.isSecureTextEntry = passwordMaskUIButton.isSelected
        passwordMaskUIButton.isSelected.toggle()
        
        if ( passwordMaskUIButton.isSelected == true) {
            passwordMaskUIButton.setImage(UIImage(named: "icn_password_shown"), for: .normal)
        }else {
            passwordMaskUIButton.setImage(UIImage(named: "icn_password_hidden"), for: .normal)
        }
        
    }
    
    @IBAction func passwordTextFieldButtonDidTap(_ sender: Any) {
        
        // 삼항 연산자 사용
        goToNextUIButton.isEnabled = passwordUITextField.hasText == true ?  true : false
        
        goToNextUIButton.backgroundColor = goToNextUIButton.isEnabled == true ? UIColor(displayP3Red: 55/255, green: 151/255, blue: 239/255, alpha: 1) : UIColor(displayP3Red: 148/255, green: 200/255, blue: 248/255, alpha: 1)
    }
    
    @IBAction func gotoNextVCDidTap(_ sender: Any) {
        guard let signInCompletedVC = UIStoryboard(name: "SignInCompleted", bundle: nil).instantiateViewController(withIdentifier: "SignInCompletedViewController") as? SignInCompletedViewController else {return}
        signInCompletedVC.userName = userName

        self.navigationController?.pushViewController(signInCompletedVC, animated: true)
    }

}
