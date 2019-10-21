//
//  PresentationModel.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/15.
//  Copyright © 2019 S Xu. All rights reserved.
//

import Foundation

class PresentationModel {
    
    // 存放每一面幻灯片数据
    var pages = [Page]()
    
    // 当前选中设计师的序号，默认为0
    var selectedDesignerIndex = 0
    
    // 放入数据
    func fillData(pageViews : [Page]) {
        
        for pageView in pageViews{
            self.pages.append(pageView)
        }
        
    }
    
    
}
