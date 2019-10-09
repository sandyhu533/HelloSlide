//
//  Word.swift
//  TestforSize3.0
//
//  Created by iOS_Club-29 on 2019/10/1.
//  Copyright © 2019 iOS_Club-29. All rights reserved.
//

import Foundation

class Word{
    
    //大纲文件有多页
    var WordData=[PageData]()

    func addNewPage(){
        self.WordData.append(PageData())
    }
    
    //更新Word
    func reNewWord(id pageid:Int, information:[wordFromOutline]){
        removeAllElements(id: pageid)
        for x in information{
            self.WordData[pageid].createNewNode(id: x.id, type: x.type, content: x.content, parentid:x.parentid)
        }
    }
    
    //返回这一页的PageData
    func getThisPage(id pageid:Int)->PageData{
        return self.WordData[pageid]
    }
    
    //清除所有元素
    func removeAllElements(id pageid:Int){
        for i in 0..<WordData[pageid].PageData.count{
            self.WordData[pageid].PageData.remove(at: i)
        }
    }
}

class PageData{
    
    //一页有很多个小元素
    var PageData:[PageNode]
    
    init() {
        self.PageData=[PageNode]()
    }
    
    //把每一级标题元素添加进页面中
    func createNewNode(id:Int,type:kind,content:String,parentid:Int?){
        self.PageData.append(PageNode(id: id, type: type, content: content, parentid: parentid))
        if let parent=parentid{
            self.PageData[parent].createNewChild(childid: id)
        }
    }
    
    //返回某个parentID的所有孩子
    func getAllChild(parentid id:Int)->[PageNode]{
        var temp=[PageNode]()
        let temps=PageData[id].childid
        for x in temps{
            temp.append(PageData[x])
        }
        return temp
    }
}

class PageNode{
    
    var id:Int
    var type:kind
    var content:String
    var stackid:Int?
    private var parentid:Int?
    var childid:[Int]
    var childnum:Int
    
    init(id:Int,type:kind,content:String,parentid:Int?){
        self.id=id
        self.type=type
        self.content=content
        self.childid=[Int]()
        self.parentid=parentid
        self.stackid=0
        childnum=0
    }
    
    func createNewChild(childid id:Int){
        self.childid.append(id)
        self.childnum+=1
    }
}

enum kind{
    case firsttitle
    case secondtitle
    case thirdtitle
}

class wordFromOutline{
    var id:Int
    var type:kind
    var content:String
    var parentid:Int?
    init(id:Int,type:kind,content:String,parentid:Int?){
        self.id=id
        self.content=content
        self.type=type
        self.parentid=parentid
    }
}