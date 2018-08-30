//
//  GuideViewController.swift
//  Demo
//
//  Created by 郭景豪 on 2018/7/7.
//  Copyright © 2018年 Tank. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {

    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    @IBOutlet weak var guideScrollview: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        //顯示幾個點點
        pageControl.numberOfPages = 4
        //當前是哪一個點點
        pageControl.currentPage = 0
        //其他點點的顏色
        pageControl.pageIndicatorTintColor = UIColor.gray
        //當前點的顏色
        pageControl.currentPageIndicatorTintColor = UIColor.white
        //限制pageControl不可以被點到
        pageControl.isUserInteractionEnabled = false
        

        //將自己指定為 scrollview 的 delegate
        guideScrollview.delegate = self
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func okButtonPress(_ sender: Any) {
        
        
        
        UserDefaults.standard.set(true, forKey: checkSeeGuide)
        
        
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        
        self.present(loginViewController!, animated: true, completion: nil)
 
    }
    
}


extension GuideViewController : UIScrollViewDelegate {
    
    
    //滑動結束的時候 scrollview會呼叫delegate(遵從scrollviewDelegate protocol )這邊就是指這個ViewController 裡面的 scrollViewDidEndDecelerating 方法。
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        //取得目前內容偏移的x位置
        print(scrollView.contentOffset.x)
        
        //使用偏移位置 除 螢幕寬 就可以得到當前是哪一個頁面
        //0/375 = 0  375/375 = 1  750/375 = 2
        let index = Int(scrollView.contentOffset.x/self.view.frame.width)
        
        //告訴pageControl 當前頁面是哪一個點。
        pageControl.currentPage = index
        
    }
    
    
}


