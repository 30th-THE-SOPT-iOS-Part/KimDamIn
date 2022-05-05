//
//  SignInCompletedViewController.swift
//  iOS_assignment2
//
//  Created by 김담인 on 2022/04/17.
//

import UIKit

final class SignInCompletedViewController: UIViewController {
    
    //MARK: - Property
    
    var userName:String?
    
    //MARK: - IBOulet
    @IBOutlet weak var completedMessageLabel: UILabel!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessageLabel()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Function
    private func setMessageLabel() {
        guard let name = userName else { return }
        completedMessageLabel.text = "\(name)님 instagram에\n오신 것을 환영합니다."
    }
    
    
    //MARK: - IBAction
    @IBAction func doneButtonDidTap(_ sender: Any) {
        guard let mainTabVC = UIStoryboard(name: "MainTab", bundle: nil).instantiateViewController(withIdentifier: "MainTabViewController") as? MainTabViewController else {return}
       
        self.navigationController?.pushViewController(mainTabVC, animated: true)
        
    }
    
    @IBAction func loginAnotherButtonDidTap(_ sender: Any) {
//
//        guard let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {return}
//
//         //rootView로 돌아가기 전에 textField를 초기화 하려고 했는데 에러남
//        loginVC.setTextField()
        
        self.navigationController?.popToRootViewController(animated: true) 
        
        
        
        
    }
    
}
