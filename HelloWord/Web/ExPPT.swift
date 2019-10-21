//
//  ExPPT.swift
//  PostJSONTest
//
//  Created by S Xu on 2019/10/12.
//  Copyright © 2019 S Xu. All rights reserved.
//

import UIKit

class ExPPT {
    
    func postJsonData(images:[UIImage],path:String,completion: @escaping (String) -> ()) {
        
        // 图片转base64
        var imagebases:[String] = []
        for image in images{
            let base = (image.pngData()?.base64EncodedString())!
            imagebases.append(base)
        }
        
        mlog(message: "发送POST请求exPPT", infoType: .DEBUG)
        
        // 请求地址
        let url = "https://coconutnut.xyz:2024/exppt"
        
        // 设置请求参数
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        // 传图片base64数组
        let json = ["imagebases":imagebases]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // 装入request
        request.httpBody = jsonData
        
        
        let session = URLSession.shared
        //下载任务
        let downloadTask = session.downloadTask(with: request,
                                                completionHandler: { (location:URL?, response:URLResponse?, error:Error?)
                                                    -> Void in
                                                    //输出下载文件原来的存放目录
//                                                    print("location:\(location)")
                                                    //location位置转换
                                                    let locationPath = location!.path
                                                    //拷贝到用户目录
                                                    let documnets:String = NSHomeDirectory() + path
                                                    //创建文件管理器
                                                    let fileManager = FileManager.default
                                                    try! fileManager.moveItem(atPath: locationPath, toPath: documnets)
                                                    print("new location:\(documnets)")
        })
        
        //使用resume方法启动任务
        downloadTask.resume()
        
    }
    
}
