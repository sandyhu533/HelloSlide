//
//  SingleSlideView.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/14.
//  Copyright © 2019 S Xu. All rights reserved.
//

import UIKit

class SingleSlideView: UIView {

//    var slide = PageView()
    
    override func draw(_ rect: CGRect) {

        // 调试用
        mlog(message: "self.frame \(self.frame)", infoType: .SLIDE_LOCATION)
        mlog(message: "self.bounds \(self.bounds)", infoType: .SLIDE_LOCATION)
 
        self.draw(rect)
        // 调整背景大小
        // 初始化时，有时frame左上角不为0
//        slide.background?.frame = self.bounds
//        slide.background?.bounds = self.bounds
        
    }

}
