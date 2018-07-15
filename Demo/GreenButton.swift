//
//  GreenButton.swift
//  Demo
//
//  Created by 郭景豪 on 2018/7/7.
//  Copyright © 2018年 Tank. All rights reserved.
//

import UIKit

class GreenButton: BaseButton {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //layer 是圖層
        //設定自己圖層的的圓角
        self.layer.cornerRadius = rect.size.height / 3
        //設定自己要裁邊
        self.layer.masksToBounds = true
        //設定自己的邊框
        self.layer.borderColor = UIColor(red: 84/255, green: 170/255, blue: 121/255, alpha: 1).cgColor
        //邊框的寬度
        self.layer.borderWidth = 5

    }
    
    //複寫 父類別 的 func
    override func setupUI() {
        super.setupUI()
        //120 219 136
        //84 170 121
        self.backgroundColor = UIColor(red: 120/255, green: 219/255, blue: 136/255, alpha: 1)
        
    }
    
    
}
