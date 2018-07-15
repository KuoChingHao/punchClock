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
        
        //重Storyboard中依靠identifier 這個標籤 去找到我們要的ViewController 再給予他的型別(as StartViewController)
        let startViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
        
        //呈現出viewController 第一個參數是 viewcontrooler 第二個是 是否要動畫 第三個是呈現後想要做什麼事
        self.present(startViewController, animated: true, completion: nil)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
