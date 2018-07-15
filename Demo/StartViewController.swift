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
    

}
