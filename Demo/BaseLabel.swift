//
//  BaseLabel.swift
//  Demo
//
//  Created by 郭景豪 on 2018/7/7.
//  Copyright © 2018年 Tank. All rights reserved.
//

import UIKit
@IBDesignable
class BaseLabel: UILabel {
    
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
    
    
    //設定UI
    func setupUI(){
        //設定文字顏色
        self.textColor = UIColor.black
        //設定左中右位置
        self.textAlignment = .center //設在置中
        //設定文字大小跟字型
        self.font = UIFont.systemFont(ofSize: 50)
        //行數
        self.numberOfLines = 0//不限行數
    }
    
    
    
}
