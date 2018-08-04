//
//  BaseViewController.swift
//  Demo
//
//  Created by 郭景豪 on 2018/8/4.
//  Copyright © 2018年 Tank. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func errorAlert(message : String) {
        
        //初始化方式
        let alertController = UIAlertController(title: "錯誤", message: message, preferredStyle: .alert)
        //初始化按鈕
        let action = UIAlertAction(title: "ＯＫ", style: .cancel) { (action) in
            //按下按鈕要做的事情
            print("我按了 \(action.title!)")
        }
        
        //加入按鈕到alertController
        alertController.addAction(action)
        //呈現出來
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    func showAlert(message : String) {
        
        //初始化方式
        let alertController = UIAlertController(title: "恭喜", message: message, preferredStyle: .alert)
        //初始化按鈕
        let action = UIAlertAction(title: "ＯＫ", style: .cancel) { (action) in
            //按下按鈕要做的事情
            print("我按了 \(action.title!)")
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
        //加入按鈕到alertController
        alertController.addAction(action)
        //呈現出來
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}
