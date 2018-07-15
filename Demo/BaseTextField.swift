//
//  BaseTextField.swift
//  Demo
//
//  Created by 郭景豪 on 2018/7/14.
//  Copyright © 2018年 Tank. All rights reserved.
//

import UIKit

class BaseTextField: UITextField {

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
    //改變大小的時候會呼叫 draw 在此可以取得改變後的size 並去修正邊框等等...
    override func draw(_ rect: CGRect) {
        //layer 是圖層
        //設定自己圖層的的圓角
        self.layer.cornerRadius = rect.size.height / 3
        //設定自己要裁邊
        self.layer.masksToBounds = true
    }
    
    
    func setupUI(){
        //設定背景顏色
        self.backgroundColor = UIColor.white
        //設定文字大小
        self.font = UIFont.systemFont(ofSize: 18)

        //寬度決定要偏移多少
        let paddingOffset = 15
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingOffset, height: 10))
        //textfield 有分左邊的View 跟中間文字內容 和右邊的View
        //平常看到的小XX 就是右邊的View
        self.leftView = paddingView
        //一直出現著
        self.leftViewMode = UITextFieldViewMode.always
        
        //右邊叉叉的View設定只有在編輯的時候出現
        self.rightViewMode = UITextFieldViewMode.whileEditing
    }
}
