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
    
    //template总数
    var templateNum = 2
    //当前在使用的template
    var currentTemplate = 0
    
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
            let compsings = findMatchedComposeing(pageinfo:wordpage.getPageInfo(), templateid: templateid, colorid: colorid)
            self.myHelloword.reNewHellowordFixed(composings:compsings, datasource: wordpage, in: pageid)
        }
        
        print("TEST1")
        print("myWord.W.count  \(myWord.WordData.count)")
    }
    
//    //更换模版
//    func changeTemplateOrColor(templateId: Int,colorId:Int = 1){
//
//        print("~~~~~~~~\(templateId)")
//        print("~~~~~~~\(currentTemplate)")
//        if templateId < templateNum && templateId != currentTemplate{
//            print("CHANGING TAMPLATE!!\(templateId)!")
//            currentTemplate = templateId
//            //每一页
////            for (index,page) in myWord.WordData.enumerated() {
////                var pageWord = [wordFromOutline]()
////                //每一页中的每个元素
////                for node in page.pageData{
////                    let nodeWord = wordFromOutline(id: node.id, type: node.type, content: node.content, parentid: node.parentid)
////                    pageWord.append(nodeWord)
////                }
////            }
//            print("wordDATACount\(myWord.WordData.count)")
//            for index in 0..<myWord.WordData.count{
//                let wordpage = self.myWord.getthispage(id: index)
//
//                if(templateId == 0){
//                    self.myHelloword.reNewHellowordFluid(id: index, datasource: wordpage, colorid: colorId)
//                }
//                else{
//                    let compsings = findMatchedComposeing(pageinfo:wordpage.getPageInfo(), templateid: templateId, colorid: colorId)
//                    print("*************I get you\(compsings)*****************")
//                    self.myHelloword.reNewHellowordFixed(composings: compsings, datasource: wordpage, in: index)
//
//                }
//            }
//        }
//        else {
//            self.myHelloword.HellowordData.removeAll()
//            self.myWord.WordData.removeAll()
//        }
//
//    }
    
    
//    //从Slide页面来的modify
//    func modifiedfromview(changecolor:Bool, changetemplate:Bool, colorid:Int?, viewid:Int? ){
//        if(changecolor){
//            self.myHelloword.changecolorforall()
//        }
//        if(changetemplate){
//            self.myHelloword.changetemplateonthispage()
//        }
//    }
    
    //???
    
}

