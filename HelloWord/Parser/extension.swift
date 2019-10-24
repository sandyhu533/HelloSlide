//
//  extension.swift
//  HelloWord
//
//  Created by iOS_Club-29 on 2019/10/15.
//  Copyright © 2019 HelloWord. All rights reserved.
//

import Foundation
import UIKit
extension CGRect{
    var bigSquare:CGRect{
        let bianchang = self.width>self.height ? self.width:self.height
        return(CGRect(x: self.minX, y: self.minY, width: bianchang, height: bianchang))
    }
    var smallSquare:CGRect{
        let bianchang = self.width<self.height ? self.width:self.height
        return(CGRect(x: self.minX, y: self.minY, width: bianchang, height: bianchang))
    }
    
}

extension String{
    var x:CGFloat{
        let index1 = self.index(self.startIndex, offsetBy: 0)
        let index2 = self.index(self.startIndex, offsetBy: 3)
        let str1=self[index1..<index2]
        return(CGFloat(Double(String(str1))!)*0.001)
    }
    var y:CGFloat{
        let index1 = self.index(self.startIndex, offsetBy: 3)
        let index2 = self.index(self.startIndex, offsetBy: 6)
        let str1=self[index1..<index2]
        return(CGFloat(Double(String(str1))!)*0.001)
    }
    var width:CGFloat{
        let index1 = self.index(self.startIndex, offsetBy: 6)
        let index2 = self.index(self.startIndex, offsetBy: 9)
        let str1 = self[index1..<index2]
        var num = CGFloat(Double(String(str1))!)
        if(num == CGFloat.zero){
            num = 1000
        }
        return(num*0.001)
    }
    var height:CGFloat{
        let index1 = self.index(self.startIndex, offsetBy: 9)
        let index2 = self.index(self.startIndex, offsetBy: 12)
        let str1=self[index1..<index2]
        var num = CGFloat(Double(String(str1))!)
        if(num == CGFloat.zero){
            num = 1000
        }
        return(num*0.001)

    }

    
    var rect:CGRect{
        return(CGRect(x: self.x, y: self.y, width: self.width, height: self.height))
    }
    var hexcolor:UIColor{
        let index=self.index(self.startIndex, offsetBy: 2)
        let mycolor=self[index...]
        let rgbValue=Int(mycolor,radix: 16)
        return UIColor(red: ((CGFloat)((rgbValue! & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgbValue! & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgbValue! & 0xFF)) / 255.0,
                       alpha: 1.0)

    }
    var get12array : [String]{
        var res = [String]()
        for i in 0..<self.count/12{
            let index1 = self.index(self.startIndex, offsetBy: i*12)
            let index2 = self.index(self.startIndex, offsetBy: (i+1)*12)
            let str1=self[index1..<index2]
            res.append(String(str1))
        }
        return res
    }
    var get8array: [String]{
        var res = [String]()
        for i in 0..<self.count/8{
            let index1 = self.index(self.startIndex, offsetBy: i*8)
            let index2 = self.index(self.startIndex, offsetBy: (i+1)*8)
            let str1=self[index1..<index2]
            res.append(String(str1))
        }
        return res
    }
}

extension UIImage {
    /**
     *  重设图片大小
     */
    func reSizeImage(reSize:CGSize)-> UIImage? {
        //UIGraphicsBeginImageContext(reSize);
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height))
        let reSizeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return reSizeImage
    }
    
    /**
     *  等比率缩放
     */
    func scaleImage(scaleSize:CGFloat)-> UIImage? {
        let reSize = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        return reSizeImage(reSize: reSize)
    }
}

extension UIColor{
    open class var randomcolor:UIColor{
        get
        {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
}
