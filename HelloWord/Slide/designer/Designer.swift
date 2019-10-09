//
//  Designer.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/15.
//  Copyright © 2019 S Xu. All rights reserved.
//

import Foundation
import UIKit

class Designer {
    
    // 设计师头像图片名
    var imageName = ""
    
    // 设计师是否被选中
    var isSelected = false
    
    // 当前选中的模板
    var selectedTemplateIndex = 0
    
    // 设计师的模板们
    var templates = [DesignerTemplate]()
    
}
