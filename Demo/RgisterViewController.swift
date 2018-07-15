//
//  RgisterViewController.swift
//  Demo
//
//  Created by 郭景豪 on 2018/7/14.
//  Copyright © 2018年 Tank. All rights reserved.
//

import UIKit

class RgisterViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: BaseTextField!
    
    @IBOutlet weak var passwordTextField: BaseTextField!
    
    @IBOutlet weak var passwordConfirmTextField: BaseTextField!
    
    
    @IBOutlet weak var nicknameTextField: BaseTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordConfirmTextField.delegate = self
        nicknameTextField.delegate = self
     
        //設定hint文字
        //NSLocalizedString("stringKey", comment: "email") 會去抓對應的stringKey 來呈現文字
        emailTextField.placeholder = "email"
        passwordTextField.placeholder = "password"
        passwordConfirmTextField.placeholder = "password confirm"
        nicknameTextField.placeholder = "nickname"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerAccountButtonAction(_ sender: Any) {
        //檢查email 如果長度> 0 才可以繼續往下執行
        guard let email = emailTextField.text , email.count > 0 else {
            print("未輸入 email")
            return
        }
        guard let password = passwordTextField.text , password.count > 0 else {
            print("未輸入 password")
            return
        }
        guard let passwordConfirm = passwordConfirmTextField.text , passwordConfirm.count > 0 else {
            print("未輸入 passwordConfirm")
            return
        }
        guard let nickname = nicknameTextField.text , nickname.count > 0 else {
            print("未輸入 nickname")
            return
        }
        //檢查密碼與驗證密碼是否相同
        guard password == passwordConfirm else {
            print("密碼不相同")
            return
        }

        //session init
        let session = URLSession(configuration: .default)
        
        //網址
        let urlString = "http://192.168.50.75:8888/PunchClock/index.php/boss/create"
        //產生URL 如果不是URL就不往下處理
        guard let url = URL(string: urlString) else {
            return
        }
        
        //創建請求
        var urlRequest = URLRequest(url: url)
        //請求方式 "GET POST DELETE PUT ....."
        urlRequest.httpMethod = "POST"
        //請求的Head 告訴Server Content-Type(資料的內容格式) application/json(是json格式)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //把key 跟 資料建立起來。
        let dictionary = ["email":email,"password":password,"nickname":nickname]
        
        do {
            //將資料轉換成 json data
            let json =
                try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        
            //把json data 給 urlRequest 的 httpBody
            urlRequest.httpBody = json
            
        }catch {
            print("資料格式不符合")
        }
        
        //使用 session 分派任務 ，所分派的任務就是urlRequest
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            //結束會回傳 資料(data) 跟 傳輸的資訊(response) 或是 錯誤(error)
            
            //如果有錯誤 就表示請求失敗
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
                    //將data 轉換成 jsonObject
                    let jsonObject = try? JSONSerialization.jsonObject(with: unwappData, options: [])
                    //解第一層
                    guard let json = jsonObject as? [String : Any] else {
                        print("不是 [String : Any] 的型別")
                        return
                    }
                    //找出 result
                    guard let result = json["result"] as? String ,result == "0" else {
                        print("server 告知 資訊有誤")
                        return
                    }
                    guard let jsonContentData = json["data"] as? [String : Any] else{
                        print("沒有 jsonContentData")
                        return
                    }
                    
                    guard let user = jsonContentData["user"] as? [String : String] else {
                        print("沒有user 資料")
                        return
                    }
                    
                    print(user)
                    
                    let u_user_id = user["user_id"] ?? ""
                    let u_token = user["token"] ?? ""
                    let u_email = user["email"] ?? ""
                    let u_nickanme = user["nickname"] ?? ""
                    print(u_user_id)
                    print(u_token)
                    print(u_email)
                    print(u_nickanme)

                    
                }catch {
                    print("data 轉 jsonObject 失敗")
                }
            }
        }
        //啟動dataTask 去執行
        dataTask.resume()
    }
}

//擴充 RgisterViewController 使其遵從 UITextFieldDelegate
extension RgisterViewController : UITextFieldDelegate {
    //當keyboard 被按下 return 時 會告知他的delegate 去執行 textFieldShouldReturn方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("我按下了 return ")
        //判斷是哪一個textfield 的 keyboard 所按下的 return
        if textField == emailTextField {
            //如果是 輸入email的textField 那就讓 passwordTextField 的鍵盤起來
            passwordTextField.becomeFirstResponder()
        }else if textField == passwordTextField {

            passwordConfirmTextField.becomeFirstResponder()
        }else if textField == passwordConfirmTextField {

            nicknameTextField.becomeFirstResponder()
        }else {
            //取消鍵盤
            textField.resignFirstResponder()
        }
        return false
    }
}


