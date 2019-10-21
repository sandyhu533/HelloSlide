//
//  PageInfo.swift
//  HelloWord
//
//  Created by iOS_Club-29 on 2019/10/15.
//  Copyright © 2019 HelloWord. All rights reserved.
//

import Foundation
struct PageInfo:Equatable{
    var firstnum = 0
    var secondnum = 0
    var thirdnum = 0
    var imagenum = 0
    init(firstnum:Int,secondnum:Int,thirdnum:Int,imagenum:Int){
        self.firstnum = firstnum
        self.secondnum = secondnum
        self.thirdnum = thirdnum
        self.imagenum = imagenum
    }
    init(){
        self.firstnum = 0
        self.secondnum = 0
        self.thirdnum = 0
        self.imagenum = 0
    }
    func getpageinfonum()->Int16{
        let num = (self.firstnum*1000)+(self.secondnum*100)+(self.thirdnum*10)+(self.imagenum)
        return(Int16(num))
    }
    
}
