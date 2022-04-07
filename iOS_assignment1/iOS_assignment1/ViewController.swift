//
//  ViewController.swift
//  iOS_assignment1
//
//  Created by 김담인 on 2022/04/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginUIButton: UIButton!
    @IBOutlet weak var askingSignUpLabel: UILabel!
    @IBOutlet weak var signUpUIButton: UIButton!
    @IBOutlet weak var eyeIconUIButton: UIButton!
    
    var eyeIcon = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginUIButton.isEnabled = false
        
        logoImage.image = UIImage(named: "Instagram Black Logo")
        
        eyeIconUIButton.setImage(UIImage(named: "password hidden eye icon"), for: .normal)

        
        userNameTextField.placeholder = "전화번호, 사용자 이름 또는 이메일"
        userNameTextField.clearButtonMode = .whileEditing
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.clearButtonMode = .whileEditing
        
        loginUIButton.setTitle("로그인", for: .normal)
        loginUIButton.setTitleColor(.white, for: .normal)
        loginUIButton.backgroundColor = .systemBlue
        
        askingSignUpLabel.text = "계정이 없으신가요?"
        askingSignUpLabel.sizeToFit()
        
        signUpUIButton.setTitle("가입하기", for: .normal)
        signUpUIButton.sizeToFit()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .gray
        
        loginUIButton.isEnabled = false
        
       
    }
    @IBAction func eyeIconButton(_ sender: Any) {
        if(eyeIcon == true) {
            passwordTextField.isSecureTextEntry = false
            eyeIconUIButton.setImage(UIImage(named: "password shown eye icon"), for: .normal)
            
        }else {
            passwordTextField.isSecureTextEntry = true
            eyeIconUIButton.setImage(UIImage(named: "password hidden eye icon"), for: .normal)
        }

        eyeIcon = !eyeIcon
    }
    
    @IBAction func userNameTextFieldAction(_ sender: Any) {
        
        if (userNameTextField.text?.isEmpty != nil && passwordTextField.text?.isEmpty != nil && userNameTextField.text != "" && passwordTextField.text != "") {
            
            loginUIButton.isEnabled = true
            
        }else {
            loginUIButton.isEnabled = false
        }
    }
    
    @IBAction func passwordTextFieldAction(_ sender: Any) {
        
        if (userNameTextField.text != nil && passwordTextField.text != nil && userNameTextField.text != "" && passwordTextField.text != "") {
            
            loginUIButton.isEnabled = true
            
        }else {
            loginUIButton.isEnabled = false
        }
    }
    

    @IBAction func loginButton(_ sender: UIButton) {
        
       
        
        guard let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController else { return }
        signInVC.userName = userNameTextField.text
        
        self.present(signInVC, animated: true)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        guard let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpFirstViewController") as? SignUpFirstViewController else { return }
        
        self.navigationController?.pushViewController(signUpVC, animated: true)

    }
    
    
    
    
}

