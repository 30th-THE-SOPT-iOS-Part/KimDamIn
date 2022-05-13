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
    var isSignUpSuccess = false //signUp() 실행 결과의 참,거짓을 저장하기 위한 변수
    
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
        goToNextUIButton.isEnabled = passwordUITextField.hasText
        
        goToNextUIButton.backgroundColor = goToNextUIButton.isEnabled ? UIColor.skyBlue : UIColor.lightBlue
    }
    
    @IBAction func gotoNextVCDidTap(_ sender: Any) {
        //비밀번호까지 입력 마친후 완료버튼 클릭시 signUp() 함수를 호출해 가입 유효 여부 판별
        signUp()
    }

}

//MARK: - SignUp Request
extension SignUpPasswordViewController {
    
    // 회원가입을 위한 서버통신 구현 함수
    func signUp() {
        
        guard let name = userName else { return }
        guard let email = userName else { return } // UserName 입력 창에서 받아온 변수 대입
        guard let password = passwordUITextField.text else { return }
        
        // 서버 통신 서비스 코드를 싱글톤 변수를 통해서 접근
        // 호출 후에 받은 응답을 가지고, 적절한 처리
        UserService.shared.signUp(
            name: name,
            email: email,
            password: password) { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                print(data)
                // 가입한 아이디가 중복일때(409) 알림 메시지 변경 및 isSignUpSuccess - false
                if data.status == 409{
                    self.isSignUpSuccess = false
                    self.alert(message: "이미 가입된 아이디입니다.")
                }
                else{
                    // 정상적으로 가입되었을때 isSignUpSuccess - true
                    self.isSignUpSuccess = true
                    // signInCompletedVC로 이동 후 -> alert 함수 호출
                    guard let signInCompletedVC = UIStoryboard(name: "SignInCompleted", bundle: nil).instantiateViewController(withIdentifier: "SignInCompletedViewController") as? SignInCompletedViewController else {return}
                    // 유전네임 전달
                    signInCompletedVC.userName = self.userName
                    
                   self.navigationController?.pushViewController(signInCompletedVC, animated: true)
                    self.alert(message: data.message)
                }
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
    
    // 알림창을 띄우는 함수입니다.
    func alert(message: String) {
        let alertVC = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        { action in
                // isSignSuccess 값에 따라 확인버튼을 눌렀을때 로그인창으로 갈지, 아이디 입력창으로 갈지 처리
            if self.isSignUpSuccess {
                self.navigationController?.popToRootViewController(animated: true)
            }else {
                self.navigationController?.popViewController(animated: true)
            }
        }
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
}
