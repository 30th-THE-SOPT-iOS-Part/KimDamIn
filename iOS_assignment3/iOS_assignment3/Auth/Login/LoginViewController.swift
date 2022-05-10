//
//  LoginViewController.swift
//  iOS_assignment2
//
//  Created by 김담인 on 2022/04/16.
//

import UIKit

// final 키워드 사용
final class LoginViewController: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginUIButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // 함수로 분리
        setTextField()
        setLoginButton()
        
    }
    
    //MARK: - Function
    
    func setTextField() {
        userNameTextField.placeholder = "전화번호, 사용자 이름 또는 이메일"
        userNameTextField.clearButtonMode = .whileEditing
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.isSecureTextEntry = true
    }
   
    
    func setLoginButton() {
        loginUIButton.setTitle("로그인", for: .normal)
        loginUIButton.setTitleColor(.white, for: .normal)
        loginUIButton.isEnabled = false
    }
    

    
    //MARK: - IBAction
    
    @IBAction func userNameTextFielButton(_ sender: Any) {
        
        // 삼항 연산자 사용
        loginUIButton.isEnabled = userNameTextField.hasText == true && passwordTextField.hasText == true ?  true : false
        
        loginUIButton.backgroundColor = loginUIButton.isEnabled == true ? UIColor(displayP3Red: 55/255, green: 151/255, blue: 239/255, alpha: 1) : UIColor(displayP3Red: 148/255, green: 200/255, blue: 248/255, alpha: 1)
    }
    
    @IBAction func passwordTextFieldButton(_ sender: Any) {
        
        // 삼항 연산자 사용
        loginUIButton.isEnabled = userNameTextField.hasText == true && passwordTextField.hasText == true ?  true : false
        
        loginUIButton.backgroundColor = loginUIButton.isEnabled == true ? UIColor(displayP3Red: 55/255, green: 151/255, blue: 239/255, alpha: 1) : UIColor(displayP3Red: 148/255, green: 200/255, blue: 248/255, alpha: 1)
    }
    
    
    
    @IBAction func forgotPasswordButtonDidTap(_ sender: Any) {
        
    }
    
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
         
        guard let signInCompletedVC = UIStoryboard(name: "SignInCompleted", bundle: nil).instantiateViewController(withIdentifier: "SignInCompletedViewController") as? SignInCompletedViewController else {return}
        signInCompletedVC.userName = userNameTextField.text

        self.navigationController?.pushViewController(signInCompletedVC, animated: true)
        
    }
    
    @IBAction func signUpButtonDidTap(_ sender: Any) {
        guard let signUpUserNameVC = UIStoryboard(name: "SignUpUserName", bundle: nil).instantiateViewController(withIdentifier: "SignUpUserNameViewController") as? SignUpUserNameViewController else {return}
        
        self.navigationController?.pushViewController(signUpUserNameVC, animated: true)
        
        
    }
    
}
