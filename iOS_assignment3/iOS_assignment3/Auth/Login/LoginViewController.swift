//
//  LoginViewController.swift
//  iOS_assignment2
//
//  Created by 김담인 on 2022/04/16.
//

import UIKit

// final 키워드 사용
final class LoginViewController: UIViewController {
    
    var isLoginSuccess = false // signUp() 실행 결과의 참,거짓을 저장하기 위한 변수
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginUIButton: UIButton!
    @IBOutlet weak var passwordEyeButton: UIButton!
    
    
    //MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        resetTextField()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        setLoginButton()
        
    }

    
    //MARK: - Function
    
    func resetTextField() {
        userNameTextField.attributedText = .none
        passwordTextField.attributedText = .none
    }
    
    func setTextField() {
        userNameTextField.placeholder = "전화번호, 사용자 이름 또는 이메일"
        userNameTextField.clearButtonMode = .whileEditing
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.isSecureTextEntry = true
    }
   
    
    func setLoginButton() {
        loginUIButton.setTitle("로그인", for: .normal)
        loginUIButton.setTitleColor(.white, for: .normal)
        loginUIButton.backgroundColor = UIColor.lightBlue
        loginUIButton.isEnabled = false
    }
    

    
    //MARK: - IBAction
    
    @IBAction func userNameTextFielButton(_ sender: Any) {
        
        // 삼항 연산자 사용
        loginUIButton.isEnabled = userNameTextField.hasText && passwordTextField.hasText
        
        loginUIButton.backgroundColor = loginUIButton.isEnabled ? UIColor.skyBlue : UIColor.lightBlue
    }
    
    @IBAction func passwordTextFieldButton(_ sender: Any) {
        
        // 삼항 연산자 사용
        loginUIButton.isEnabled = userNameTextField.hasText && passwordTextField.hasText
        
        loginUIButton.backgroundColor = loginUIButton.isEnabled ? UIColor.skyBlue : UIColor.lightBlue
    }
    
    @IBAction func passwordEyeButtonDidTap(_ sender: Any) {
        
        passwordTextField.isSecureTextEntry.toggle()
        passwordEyeButton.isSelected.toggle()
        let eyeImage = passwordEyeButton.isSelected ? "icn_password_shown" : "icn_password_hidden"
        passwordEyeButton.setImage(UIImage(named: eyeImage), for: .normal)
        passwordEyeButton.tintColor = .clear
    }
    
    @IBAction func forgotPasswordButtonDidTap(_ sender: Any) {
        
    }
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
         
        login()
        if isLoginSuccess
        {
            guard let signInCompletedVC = UIStoryboard(name: "SignInCompleted", bundle: nil).instantiateViewController(withIdentifier: "SignInCompletedViewController") as? SignInCompletedViewController else {return}
            signInCompletedVC.userName = userNameTextField.text

            self.navigationController?.pushViewController(signInCompletedVC, animated: true)
        }
    }
    
    @IBAction func signUpButtonDidTap(_ sender: Any) {
        guard let signUpUserNameVC = UIStoryboard(name: "SignUpUserName", bundle: nil).instantiateViewController(withIdentifier: "SignUpUserNameViewController") as? SignUpUserNameViewController else {return}
        
        self.navigationController?.pushViewController(signUpUserNameVC, animated: true)
        
        
    }
    
}

extension LoginViewController {
    
    
    // 서버 통신 코드를 실제로 뷰 컨트롤러에서 호출해서 사용하는 부분입니다.
    func login() {
        
        // 각각의 텍스트 필드의 있는 값을 받아옵니다.
        guard let name = userNameTextField.text else { return  }
        guard let email = userNameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        // 서버 통신 서비스 코드를 싱글톤 변수를 통해서 접근하고 있네요.
        // 호출 후에 받은 응답을 가지고, 적절한 처리를 해주고 있습니다.
        UserService.shared.login(
            name: name,
            email: email,
            password: password) { response in
            switch response {
            case .success(let data):
                guard let data = data as? LoginResponse else { return }
            
                var message:String
                // LoginResponse의 상태에 따른 메시지 분기처리
                switch data.status {
                case 404:
                    message = "일치하는 아이디가 없습니다."
                    self.isLoginSuccess = false
                case 409:
                    message = "비밀번호가 일치하지 않습니다."
                    self.isLoginSuccess = false
                default:
                    message = data.message
                    self.isLoginSuccess = true
                }
                print(data)
                self.alert(message: message)
                
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }   
        }
    }
    
    // 알림창을 띄우는 함수
    func alert(message: String) {
        let alertVC = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
}
