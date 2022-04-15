//
//  SignUpFirstViewController.swift
//  iOS_assignment1
//
//  Created by 김담인 on 2022/04/07.
//

import UIKit

class SignUpFirstViewController: UIViewController {

    @IBOutlet weak var signUpFirstTitle: UILabel!
    @IBOutlet weak var signUpFirstSubTitle: UILabel!
    @IBOutlet weak var signUpFirstTextField: UITextField!
    @IBOutlet weak var signUpFirstUIButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpFirstTitle.text = "사용자 이름 만들기"
        signUpFirstTitle.font = .boldSystemFont(ofSize: 22)
        signUpFirstTitle.sizeToFit()
        signUpFirstSubTitle.text = "새 계정에 사용할 사용자 이름을 선택하세요. 나중에 언제든지 변경할 수 있습니다."
        signUpFirstSubTitle.sizeToFit()
        
        signUpFirstTextField.placeholder = "사용자 이름"
        signUpFirstTextField.clearButtonMode = .whileEditing

        
        signUpFirstUIButton.backgroundColor = .tintColor
        signUpFirstUIButton.setTitle("다음", for: .normal)
        signUpFirstUIButton.setTitleColor(.white, for: .normal)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .gray
        
        signUpFirstUIButton.isEnabled = false
    }
    @IBAction func signUpFirtstTextFieldAction(_ sender: Any) {
        if (signUpFirstTextField.text?.isEmpty != nil && signUpFirstTextField.text != "") {
            
            signUpFirstUIButton.isEnabled = true
            
        }else {
            signUpFirstUIButton.isEnabled = false
        }
    }
    
    @IBAction func goToSignUpSecondVC(_ sender: Any) {
        guard let signUpScecondVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpSecondViewController") as? SignUpSecondViewController else { return }
        signUpScecondVC.userName = signUpFirstTextField.text
        
        self.navigationController?.pushViewController(signUpScecondVC, animated: true)

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
