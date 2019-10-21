//
//  UIImageTintExtension.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/15.
//  Copyright © 2019 S Xu. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    // 图片染色
    func tint(color: UIColor, blendMode: CGBlendMode) -> UIImage {
        
        let drawRect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.setFill()
        UIRectFill(drawRect)
        draw(in: drawRect, blendMode: blendMode, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return tintedImage!
    }
    
        // 获取像素值，判断明暗
       func isLight(pos:CGPoint)->Bool{
        let pixelData=self.cgImage!.dataProvider!.data
           let data:UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
           let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4

           let r = CGFloat(data[pixelInfo])
           let g = CGFloat(data[pixelInfo+1])
           let b = CGFloat(data[pixelInfo+2]) 
//           let a = CGFloat(data[pixelInfo+3])

//            print("取到颜色(\(r),\(g)),\(b)")
            let gray = r*0.299 + g*0.587 + b*0.114
            
            if (gray > 155){
//                print("亮")
                return true
            }else{
//                print("暗")
                return false
            }
       }
    
}
