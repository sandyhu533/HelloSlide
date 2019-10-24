//
//  ViewController.swift
//  Testforsize3.1
//
//  Created by iOS_Club-29 on 2019/10/7.
//  Copyright © 2019 iOS_Club-29. All rights reserved.
//

import UIKit

import UIKit

class Parser{
    
    lazy var myHelloword = Helloword(frame: bounds)
    var myWord = Word()
    
    var bounds = CGRect()
    
    //在myWord和myHelloWord中添加新页
    func addnewpage(){
        self.myHelloword.addNewPage(color: UIColor.white)
        self.myWord.addNewPage()
    }
    
    //从Word来的modify
    func modifiedFromWord(id pageid:Int,information:[WordFromOutline],templateid:Int,colorid:Int){
        //如果pageid超过访问下界，则增加相应数量的newPage
        if pageid>=myWord.WordData.count {
            for index in 0...pageid-myWord.WordData.count{
                addnewpage()
                print("addView\(index)")
            }
        }
        //更新myWord中当页的信息
        self.myWord.reNewWord(id: pageid, info: information)
        print("succeed")
        print(information)
        //更新myHelloWord中当页的信息
        let wordpage = self.myWord.getthispage(id: pageid)
        
        if(templateid == 0){
            self.myHelloword.reNewHellowordFluid(id: pageid, datasource: wordpage, colorid: colorid)
        }
        else{
            
            // -MARK: 这里的1之后要变成当前模版所拥有的颜色数目
            let realid = 1
            let compsings = findMatchedComposeing(pageinfo:wordpage.getPageInfo(), templateid: templateid, colorid: realid)
            
            self.myHelloword.reNewHellowordFixed(composings:compsings, datasource: wordpage, in: pageid, colorid: realid)
        }
        
        print("TEST1")
        print("myWord.W.count  \(myWord.WordData.count)")
    }
    
}

