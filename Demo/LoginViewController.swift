//
//  LoginViewController.swift
//  Demo
//
//  Created by 郭景豪 on 2018/7/14.
//  Copyright © 2018年 Tank. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var accountTextField: BaseTextField!
    
    @IBOutlet weak var passwordTextField: BaseTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //將文字框的delegate 設定為自己
        accountTextField.delegate = self

        passwordTextField.delegate = self
        
        
        self.title = "登入"
        
        
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        //檢查email 如果長度> 0 才可以繼續往下執行
        guard let email = accountTextField.text , email.count > 0 else {
            print("未輸入 email")
            
            errorAlert(message: "未輸入 email")
            return
        }
        guard let password = passwordTextField.text , password.count > 0 else {
            print("未輸入 password")
            errorAlert(message: "未輸入 password")
            
            return
        }

        //把key 跟 資料建立起來。
        let dictionary = ["email":email,"password":password]

        //開始轉動
        activityIndicatorView.startAnimating()
        //關閉使用者交互，就是讓使用者無法點擊畫面
        self.view.isUserInteractionEnabled = false
        
        
        
        NetworkManage.sharedInstance.urlTask(urlString: SERVER_URL_STRING + "boss/login", method: .POST, params: dictionary) { (data, response, error) in

            sleep(5)

            if let httpError = error {
                //印出失敗的內容
                print("失敗 : \(httpError.localizedDescription)")
            }else {
                
                //檢查是否有狀態碼
                guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200 else {
                    print("狀態碼錯誤")
                    return
                }
                //檢查是否有資料
                guard let unwappData = data else {
                    print("沒有資料")
                    return
                }

                do {
                    
                    let testJson = try JSONSerialization.jsonObject(with: unwappData, options: [])
                    
                    print(testJson)
                    
                    
                    //將資料結構帶入解析Json
                    let json = try JSONDecoder().decode(JsonData.self, from: unwappData)
                    guard json.result == "0" else {
                        print("server 告知 資訊有誤")
                        return
                    }
                    print(json)
                    
                    //因為URLTask 是開一個執行緒，所以結束後要做UI處理的話要回到主執行緒上
                    DispatchQueue.main.async {
                        
                        //UserInfoModel會一直存在，所以把userModel 存放在UserInfoModel，這樣所有地方都可以取得到User資料
                        UserInfoModel.sharedInstance.userInfo = json.data.user

                        //停止轉動
                        self.activityIndicatorView.stopAnimating()
                        //打開使用者交互，讓使用者可以點擊畫面
                        self.view.isUserInteractionEnabled = true

                        self.showAlert(message: "登入成功")
                    }
                    
                }catch {
                    print("data 轉 jsonObject 失敗")
                }
            }
            
        }
        
        
        
        
    }
    
    
    @IBAction func registerAccountButtonAction(_ sender: Any) {
        
        
       let registerViewController =  self.storyboard?.instantiateViewController(withIdentifier: "RgisterViewController") as! RgisterViewController
        
//        self.present(registerViewController, animated: true, completion: nil)

        
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
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

