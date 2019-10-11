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
    
    var myHelloword = Helloword()
    var myWord = Word()
    
    var bounds = CGRect()
    
    //在myWord和myHelloWord中添加新页
    func addnewpage(){
        self.myHelloword.addNewPage(this: bounds, templateid: 0)
        self.myWord.addNewPage()
    }
    
    //从Word来的modify
    func modifiedFromWord(id pageid:Int,information:[wordFromOutline]){
        //如果pageid超过访问下界，则增加相应数量的newPage
        if pageid>=myWord.WordData.count {
            for index in 0...pageid-myWord.WordData.count{
                addnewpage()
                print("addView\(index)")
            }
        }
        //更新myWord中当页的信息
        self.myWord.reNewWord(id: pageid, information: information)
        print("succeed")
        print(information)
        //更新myHelloWord中当页的信息
        self.myHelloword.reNewHelloWord(id: pageid, datasource: myWord.getThisPage(id:pageid),templateid:0)
        
        print("TEST1")
        print("myHelloword.HellowordData.count  \(myHelloword.HellowordData.count)")
        print("\(myHelloword.HellowordData)")
    }
    
    
    //从Slide页面来的modify
    func modifiedfromview(changecolor:Bool, changetemplate:Bool, colorid:Int?, viewid:Int? ){
        if(changecolor){
            self.myHelloword.changecolorforall()
        }
        if(changetemplate){
            self.myHelloword.changetemplateonthispage()
        }
    }
    
    //???
    func openword(){
        let pageid=0
        //将来支持多页
        self.myHelloword.reNewHelloWord(id: pageid, datasource: myWord.getThisPage(id:pageid),templateid:0)
    }
}

