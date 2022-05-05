//
//  SignUpUserNameViewController.swift
//  iOS_assignment2
//
//  Created by 김담인 on 2022/04/16.
//

import UIKit

final class SignUpUserNameViewController: UIViewController {
    
    // MARK: - Property
    
    var userName: String?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var userNameUITextField: UITextField!
    @IBOutlet weak var goToNextUIButton: UIButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        setNextButton()
    }
    //MARK: - Function
    
    func setTextField() {
        userNameUITextField.placeholder = "사용자 이름"
        userNameUITextField.clearButtonMode = .whileEditing
        
    }
    
    func setNextButton() {
        goToNextUIButton.setTitle("다음", for: .normal)
        goToNextUIButton.setTitleColor(.white, for: .normal)
        goToNextUIButton.isEnabled = false
    }
    
    // MARK: - IBAction

    @IBAction func navBarBackButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func userNameTextFieldButtonDidTap(_ sender: Any) {
        // 삼항 연산자 사용
        goToNextUIButton.isEnabled = userNameUITextField.hasText == true ?  true : false
        
        goToNextUIButton.backgroundColor = goToNextUIButton.isEnabled == true ? UIColor(displayP3Red: 55/255, green: 151/255, blue: 239/255, alpha: 1) : UIColor(displayP3Red: 148/255, green: 200/255, blue: 248/255, alpha: 1)
    }
    
    @IBAction func gotoNextVCDidTap(_ sender: Any) {
        guard let signUpPasswordVC = UIStoryboard(name: "SignUpPassword", bundle: nil).instantiateViewController(withIdentifier: "SignUpPasswordViewController") as? SignUpPasswordViewController else {return}
        
        signUpPasswordVC.userName = userNameUITextField.text
        
        self.navigationController?.pushViewController(signUpPasswordVC, animated: true)
    }
    
    

}
