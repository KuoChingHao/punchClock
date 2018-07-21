//
//  NetworkManage.swift
//  Demo
//
//  Created by 郭景豪 on 2018/7/21.
//  Copyright © 2018年 Tank. All rights reserved.
//

import UIKit

enum HTTPMethod : String {
    case POST = "POST"
    case GET = "GET"
    case DELETE = "DELETE"
}

class NetworkManage: NSObject {

    //程式活著只會初始化一次
    static let sharedInstance = NetworkManage()
    
    func urlTask(method : HTTPMethod,params : Dictionary<String , Any>?,completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) {
        //session init
        let session = URLSession(configuration: .default)
        
        //網址
        let urlString = SERVER_URL_STRING
        //產生URL 如果不是URL就不往下處理
        guard let url = URL(string: urlString) else {
            return
        }
        
        //創建請求
        var urlRequest = URLRequest(url: url)
        //請求方式 "GET POST DELETE PUT ....."
        //enum rawValue 可以取得原始值
        urlRequest.httpMethod = method.rawValue
        //Get 的資料是放在Url 後面，所以其他的方法均要把資料放到httpBody
        if method != .GET {
            if let jsonParams = params {
                
                do {
                    //將資料轉成 json data
                    let json = try JSONSerialization.data(withJSONObject: jsonParams, options: [])
                    //把data 給 httpBody
                    urlRequest.httpBody = json
                    
                }catch {
                    
                }
            }
            //請求的Head 告訴Server Content-Type(資料的內容格式) application/json(是json格式)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        //使用 session 分派任務 ，所分派的任務就是urlRequest
//        let dataTask = session.dataTask(with: urlRequest, completionHandler: completionHandler)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            //結束會回傳 資料(data) 跟 傳輸的資訊(response) 或是 錯誤(error)
            completionHandler(data,response,error)
        }
        //啟動dataTask 去執行
        dataTask.resume()
    }
    
}
