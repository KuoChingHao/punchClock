//
//  RootViewController.swift
//  Demo
//
//  Created by 郭景豪 on 2018/7/7.
//  Copyright © 2018年 Tank. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //做判斷 決定要去哪一個頁面。

        //檢查資料存不存在 存在就跳到主頁
        if let userInfo = UserDefaults.standard.value(forKey: "userInfo") as? Dictionary<String,String> {
            
            let nickname = userInfo["nickname"]
            let email = userInfo["email"]
            let user_id = userInfo["user_id"]
            let token = userInfo["token"]

            //將Dictionary 轉成 UserModel
            let userInfoModel = UserModel(nickname: nickname!, email: email!, user_id: user_id!, token: token!)
            
            UserInfoModel.sharedInstance.userInfo = userInfoModel
            
            let startViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            
            //呈現出viewController 第一個參數是 viewcontrooler 第二個是 是否要動畫 第三個是呈現後想要做什麼事
            self.present(startViewController, animated: true, completion: nil)

            
            print(userInfo)
        }else {
            //重Storyboard中依靠identifier 這個標籤 去找到我們要的ViewController 再給予他的型別(as StartViewController)
            let startViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
            
            //呈現出viewController 第一個參數是 viewcontrooler 第二個是 是否要動畫 第三個是呈現後想要做什麼事
            self.present(startViewController, animated: true, completion: nil)

        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
