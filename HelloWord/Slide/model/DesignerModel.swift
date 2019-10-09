//
//  DesignerModel.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/15.
//  Copyright © 2019 S Xu. All rights reserved.
//

import Foundation

class DesignerModel {
    
    var designerArray = [Designer]()
    
    func getDesigners () {
        
        // 从文件中读取设计师模板数据
        designerArray = DesignerStub().getDesignersFromFile()

    }
    
}
