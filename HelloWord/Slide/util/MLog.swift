//
//  MLog.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/14.
//  Copyright © 2019 S Xu. All rights reserved.
//

import Foundation

// 提示信息的类型
enum InfoType {
    case CREATE_SLIDE      // 画每一页的过程信息
    case SLIDE_LOCATION    // view的位置信息（主要用于调整frame和bounds）
    case DESIGNER_INFO     // 设计师界面信息
    case DEBUG             // 调试信息
}

// 是否输出每种信息
var infoLevel:[InfoType:Bool] =
    [
        .CREATE_SLIDE:true,
        .SLIDE_LOCATION:false,
        .DESIGNER_INFO:true,
        .DEBUG:true
    ]

// log函数
func mlog<T>(message:T, infoType : InfoType, file:String = #file, funcName:String = #function, lineNum:Int = #line){
    
    #if DEBUG
    
    if infoLevel[infoType]! {
        let fileName = (file as NSString).lastPathComponent;
        
        print("[\(fileName)|\(funcName)|\(lineNum)] \(message)");
    }
    
    #endif
}
