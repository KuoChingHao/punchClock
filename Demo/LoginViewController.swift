//
//  LoginViewController.swift
//  Demo
//
//  Created by 郭景豪 on 2018/7/14.
//  Copyright © 2018年 Tank. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var accountTextField: BaseTextField!
    
    @IBOutlet weak var passwordTextField: BaseTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //將文字框的delegate 設定為自己
        accountTextField.delegate = self

        passwordTextField.delegate = self
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
    }
    
    
    @IBAction func registerAccountButtonAction(_ sender: Any) {
        
        
       let registerViewController =  self.storyboard?.instantiateViewController(withIdentifier: "RgisterViewController") as! RgisterViewController
        
        self.present(registerViewController, animated: true, completion: nil)
        
    }
    
    
    
    
}
//擴充 LoginViewController 使其遵從 UITextFieldDelegate
extension LoginViewController : UITextFieldDelegate {
    //當keyboard 被按下 return 時 會告知他的delegate 去執行 textFieldShouldReturn方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("我按下了 return ")
        //判斷是哪一個textfield 的 keyboard 所按下的 return
        if textField == accountTextField {
            //如果是 輸入帳號的textField 那就讓 passwordTextField 的鍵盤起來
            passwordTextField.becomeFirstResponder()
        }else {
            //取消鍵盤
            textField.resignFirstResponder()
        }
        return false
    }
}

