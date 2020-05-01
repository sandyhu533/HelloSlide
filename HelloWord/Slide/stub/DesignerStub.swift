//
//  DesignerStub.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/15.
//  Copyright © 2019 S Xu. All rights reserved.
//

import Foundation
import UIKit

class DesignerStub {
    
//    private var colors: [UIColor] = [.bittersweet(), .blizzardBlue(), .blue(), .blueBell(), .blueGreen(), .blueViolet(), .blush(), .brickRed(), .almond(), .antiqueBrass(), .apricot(), .aquamarine(), .asparagus(), .atomicTangerine(), .bananaMania(), .beaver(), .brilliantRose(), .brown(), .burntOrange(), .burntSienna(), .cadetBlue(), .canary(), .caribbeanGreen(), .carnationPink(), .cerise(), .cerulean(), .chestnut(), .copperCrayolaAlternateColor(), .copper(), .cornflowerBlue(), .cottonCandy(), .dandelion(), .denim(), .desertSand(), .eggplant(), .electricLime(), .fern(), .forestGreen(), .fuchsia(), .fuzzyWuzzy(), .gold(), .goldenrod(), .grannySmithApple(), .gray(), .green(), .greenBlue(), .greenYellow(), .hotMagenta(), .inchworm(), .indigo(), .jazzberryJam(), .jungleGreen(), .laserLemon(), .lavender(), .lemonYellow(), .lightBlue()]
//
    private var colors: [UIColor] = [.blueBell(), .asparagus(),.bittersweet(),  .aquamarine(),  .blush(), .almond(), .brickRed(), .gold(), .blueGreen(), .atomicTangerine(), .bananaMania(), .denim(), .beaver(), .indigo(), .brilliantRose(), .caribbeanGreen(), .desertSand(), .brown(), .burntOrange(), .burntSienna(), .canary(), .carnationPink(), .cerise(), .cerulean(), .chestnut(), .copperCrayolaAlternateColor(), .copper(), .cornflowerBlue(), .cottonCandy(), .dandelion(), .eggplant(), .electricLime(), .fern(), .forestGreen(), .fuchsia(), .fuzzyWuzzy(), .goldenrod(), .grannySmithApple(), .gray(), .green(), .greenBlue(), .greenYellow(), .inchworm(), .jazzberryJam(), .jungleGreen(), .laserLemon(), .lavender(), .lemonYellow(), .lightBlue()]
    
    
    // 模拟从文件中获取设计师
    func getDesignersFromFile() -> [Designer] {
        
        mlog(message: "getDesignersFromFile Stub", infoType: .DEBUG)
        
        var designersArray = [Designer]()
        
        // 从Assets中获取当前的12个设计师头像
        for i in 1...15 {
            // 创建设计师对象
            let designer = Designer()
            
            // 设置图像名
            designer.imageName = "avatar\(i)"

//            // 两套模板（头像颜色和背景颜色）
//            for j in 0...1 {
//                let designerTemplate = DesignerTemplate()
//
//                // 选色
//                // 去除随机，以删除不必要的引用
//                let randomIndex = i*2+1
//                let color = colors[randomIndex]
//
//                designerTemplate.templateID = "\(i).\(j)"
//                designerTemplate.templateIconColor = color
//                designerTemplate.backgroundDefaultColor = color
//
//                designer.templates.append(designerTemplate)
//            }
            
            // 一套模板
            let designerTemplate = DesignerTemplate()
            
            // 选色
            // 去除随机，以删除不必要的引用
            let randomIndex = i
            let color = colors[randomIndex]
            
            designerTemplate.templateID = "\(i).\(0)"
            designerTemplate.templateIconColor = color
            designerTemplate.backgroundDefaultColor = color
            
            designer.templates.append(designerTemplate)
            
            
            
            
            // 加入数组
            designersArray.append(designer)
        }
        
        return designersArray
    }
    
}
