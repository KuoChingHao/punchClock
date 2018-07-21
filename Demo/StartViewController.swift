//
//  StartViewController.swift
//  Demo
//
//  Created by 郭景豪 on 2018/7/7.
//  Copyright © 2018年 Tank. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func startButtonAction(_ sender: Any) {
        
        let guideViewController = self.storyboard?.instantiateViewController(withIdentifier: "GuideViewController") as! GuideViewController

        
        self.present(guideViewController, animated: true, completion: nil)
        
    }
    
    func showAlert() {
        
        //初始化方式
        let alertController = UIAlertController(title: "title", message: "message", preferredStyle: .actionSheet)
        //初始化按鈕
        let action = UIAlertAction(title: "cancel", style: .cancel) { (action) in
            //按下按鈕要做的事情
            print("我按了 \(action.title!)")
        }
        let action2 = UIAlertAction(title: "OK", style: .default) { (action) in
            print("我按了 \(action.title!)")
        }
        let action3 = UIAlertAction(title: "OK", style: .destructive) { (action) in
            print("我按了 \(action.title!)")
        }
        //加入按鈕到alertController
        alertController.addAction(action)
        alertController.addAction(action2)
        alertController.addAction(action3)
        
        //呈現出來
        self.present(alertController, animated: true, completion: nil)
        
    }

    

}
