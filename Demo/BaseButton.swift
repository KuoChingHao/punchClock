//
//  BaseButton.swift
//  Demo
//
//  Created by 郭景豪 on 2018/7/7.
//  Copyright © 2018年 Tank. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //這個用code創建會到這邊
        setupUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //storyboard 上面的Label繼承的話會進入這邊
        setupUI()
    }
    
    func setupUI(){
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        
        //self.titleLabel?.textColor = UIColor.black
        //button 有狀態 所以要用這個func 第一個參數是顏色 第二個是什麼狀態
        self.setTitleColor(UIColor.black, for: .normal)
        self.setTitleColor(UIColor.blue, for: .highlighted)

        
        
        
    }
    
}
