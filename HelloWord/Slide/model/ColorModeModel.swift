//
//  ColorModeModel.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/15.
//  Copyright © 2019 S Xu. All rights reserved.
//

import Foundation

class ColorModeModel {
    
    // 全局颜色模式设定，影响背景和设计师头像颜色
    enum ColorMode {
        case light
        case dark
    }
    
    static var colorMode = ColorMode.light
    
}

