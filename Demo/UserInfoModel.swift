//
//  UserInfoModel.swift
//  Demo
//
//  Created by 郭景豪 on 2018/7/21.
//  Copyright © 2018年 Tank. All rights reserved.
//

import UIKit

class UserInfoModel: NSObject {

    static let sharedInstance = UserInfoModel()
    
    var userInfo : UserModel? {
        didSet{
            if let userInfo = userInfo {
                
                
                
                let userInfoDict = ["nickname" : userInfo.nickname,
                                    "email" : userInfo.email,
                                    "user_id" : userInfo.user_id,
                                    "token" : userInfo.token]
                
                UserDefaults.standard.set(userInfoDict, forKey: "userInfo")
            }else {
                UserDefaults.standard.removeObject(forKey: "userInfo")
            }
        }
    }
    
}



struct JsonData : Codable {
    let result : String
    let data : ResultData
}

struct ResultData : Codable {
    let user : UserModel
}

//可以直接拿來解析JSON
struct UserModel : Codable {
    let nickname : String
    let email : String
    let user_id : String
    let token : String
}


