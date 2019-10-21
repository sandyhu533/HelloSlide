//
//  OCRDemo.swift
//  HelloWord
//
//  Created by S Xu on 2019/10/12.
//  Copyright © 2019 HelloWord. All rights reserved.
//

import UIKit

class OCRModel{
    
    //    var result:[wordFromOutline] = []
    
    // TODO:这里返回值改成[[wordFromOutline]]
    func run(image: UIImage,completion: @escaping ([[WordFromOutline]]?) -> ()){
        
        // 将图片转化成base64字符串
        let imageData = image.pngData()
        let base64 = imageData?.base64EncodedString()
        
        print("-----------发送POST请求-----------")
        let imageOCR = ImageOCR()
        imageOCR.postImageOcr(type: 0, name: "imageFromHelloWord", imageBase64: base64!, completion: { (results:[[WordFromOutline]]?) in
            
            print("-----------获取POST结果-----------")
            
            for (index,page) in (results?.enumerated())!{
                print("第\(index)页")
                for result in page{
                    print("id:\(result.id)")
                    print("parentid:\(result.parentid ?? -1)")
                    print("content:\(result.content)")
                    print("type:\(result.type)")
                }
            }
            
            completion(results)
            
        })
    }
    
}
