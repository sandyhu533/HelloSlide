//
//  ImageOCR.swift
//  HelloWord
//
//  Created by S Xu on 2019/10/9.
//  Copyright © 2019 HelloWord. All rights reserved.
//

import UIKit

class ImageOCR {
    
    var result:[[WordFromOutline]] = []
    
    // 向服务器发送POST请求，获取识别文字信息
    func postImageOcr(type:Int,name:String,imageBase64:String,completion: @escaping ([[WordFromOutline]]?) -> ()) {
        
        // 请求地址
        let url = "https://coconutnut.xyz:2022/imageocr"
        
        // 设置请求参数
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        // 填入json数据
        let json = ["type":type,"name":name,"imageBase64":imageBase64] as [String : Any]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // 装入request
        request.httpBody = jsonData
        
        // 发送请求
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
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
                            self.result = pageArray
                            
                        }
                    }
                }catch {
                    print(error.localizedDescription)
                }
                
                completion(self.result)
                
            }
            
        }
        
        task.resume()
        
    }
}
