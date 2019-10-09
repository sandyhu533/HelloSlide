//
//  PresentationModel.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/15.
//  Copyright © 2019 S Xu. All rights reserved.
//

import Foundation

class PresentationModel {
    
    // TODO: 测试时用
    var designerModel : DesignerModel?
    
    // 存放每一面幻灯片数据
    var pages = [Page]()
    
    // 当前选中设计师的序号，默认为0
    var selectedDesignerIndex = 0
    
//    // 根据设计师及模板序号获取幻灯片
//    func getPages(designerIndex : Int, templateIndex : Int) {
//        
//        // 模拟从文件获取数据
//        pages = PresentationStub().getPagesFromFile(designerIndex : designerIndex, templateIndex : templateIndex, designerModel : designerModel!)
//        
//    }
    
}
