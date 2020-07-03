//
//  NLPModel.swift
//  HelloWord
//
//  Created by SandyHu on 2020/7/2.
//  Copyright © 2020 HelloWord. All rights reserved.
//

import UIKit

class NLPModel {
    
    static func run(documentURL: URL, completion: @escaping ([[WordFromOutline]]?) -> ()) {
        
        // 传输地址
        let serverURL = "http://121.41.224.199:2202"
        
        // HTTP方法
        var request = URLRequest(url: URL(string: serverURL)!)
        request.httpMethod = "POST"
                
        let fileName = documentURL.description.split(separator: "/").last!
        request.addValue(String(fileName), forHTTPHeaderField: "File-Name")
        
        // 定义session返回后的下载方法
        var result:[[WordFromOutline]] = []
        let uploadCompletion: (Data?, URLResponse?, Error?) -> Void
        uploadCompletion = {
            (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            // 处理返回数据
            if let data = data {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        
                        // 获取words
                        if let words = json["words"] as? [[String:Any]]{
                            
                            var pageArray:[[WordFromOutline]] = []
                            
                            // 遍历页
                            for page in words{
                                
                                var wordArray:[WordFromOutline] = []
                                
                                // 获取当前页
                                if let wordWithTypes = page["page"] as? [[String:Any]]{
                                    
                                    // 遍历页中元素
                                    for (index,wordWithType) in wordWithTypes.enumerated(){
                                        
                                        if let content = wordWithType["content"] as? String{
                                            print("【content】\(content)")
                                            
                                            if let type = wordWithType["type"] as? Int{
                                                print("【type】\(type)")
                                                
                                                // 新建wordFromOutline对象
                                                let newWordFromOutline = WordFromOutline(id: index, type: kind(rawValue: type-1)!, content: content, parentid: 0)
                                                wordArray.append(newWordFromOutline)
                                                
                                            }
                                        }
                                    }
                                }
                                
                                pageArray.append(wordArray)
                            }
                            
                            print("-----------POST-RESULT-----------")
                            print(pageArray)
                            result = pageArray
                            
                        }
                    }
                }catch {
                    print(error.localizedDescription)
                }
                
                completion(result)
                
            }
        }
        
        print("~~~~开始传输nlp文件~~~~")
        // 建立session传输文件
        let session = URLSession.shared
        let task = session.uploadTask(with: request, fromFile: documentURL, completionHandler:uploadCompletion)
        task.resume()
    }
}
