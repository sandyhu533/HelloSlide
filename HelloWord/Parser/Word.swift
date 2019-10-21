//
//  Word.swift
//  TestforSize3.0
//
//  Created by iOS_Club-29 on 2019/10/1.
//  Copyright © 2019 iOS_Club-29. All rights reserved.
//

import Foundation

struct Word{
    var WordData:[PageData]

    
    mutating func addnewpage(){
        self.WordData.append(PageData())
    }
    init(WordData:[PageData]) {
        self.WordData=WordData
        
    }
    init(){
        self.WordData=[PageData]()
    }

    mutating func addNewPage(){
        self.WordData.append(PageData())
    }
    
    //renew是不是要删除再重写
    //是否要做检查，怎么做检查
    mutating func reNewWord(id pageid:Int,info information:[WordFromOutline]){
        removeallelements(id: pageid)
        for x in information{
            self.WordData[pageid].createnewnode(id: x.id, type: x.type, content: x.content, parentid:x.parentid)
        }
    }
    
    func getthispage(id pageid:Int)->PageData{
        return self.WordData[pageid]
    }
    
    mutating func removeallelements(id pageid:Int){
        if self.WordData.count == 0{
            return
        }
        if self.WordData[pageid].pageData.isEmpty{
            return
        }
//        for i in 0..<reverse(self.WordData[pageid].PageData.count){
//            self.WordData[pageid].PageData.remove(at: i)
//        }
        self.WordData[pageid].pageData.removeAll()
    }
    
   
}

struct PageData{
       var pageData:[PageNode]
       init() {
           self.pageData=[PageNode]()
       }
       mutating func createnewnode(id:Int,type:kind,content:Any,parentid:Int?){
           self.pageData.append(PageNode(id: id, type: type, content: content, parentid: parentid))
           if let parent=parentid{
               self.pageData[parent].createnewchild(childid: id)
           }
       }
       func getallchild(parentid id:Int) ->[PageNode]{
           var temp=[PageNode]()
           let temps=pageData[id].childid
           for x in temps{
               temp.append(pageData[x])
           }
           return temp
       }
    func getPageInfo() ->Int16{
        var res = PageInfo()
        for x in pageData{
            switch x.type{
            case .firsttitle: res.firstnum+=1
            case .secondtitle: res.secondnum+=1
            case .thirdtitle: res.thirdnum+=1
            case .image: res.imagenum+=1
            }
        }
        return res.getpageinfonum()
        
    }
    func getFirstTitles( ) ->[PageNode]{
        var res = [PageNode]()
        for x in pageData{
            if x.type == .firsttitle{
                res.append(x)
            }
        }
        return res
    }
    func getSecondTitles() ->[PageNode]{
        var res = [PageNode]()
        for x in pageData{
            if x.type == .secondtitle{
                res.append(x)
            }
        }
        return res
    }
    func getImages() ->[PageNode]{
        var res = [PageNode]()
        for x in pageData{
            if x.type == .image{
                res.append(x)
            }
        }
        return res
    }
    func getThirdTitles()->[PageNode]{
        var res = [PageNode]()
        for x in pageData{
            if x.type == .thirdtitle{
                res.append(x)
            }
        }
        return res
    }
}

struct PageNode{
       var id:Int
       var type:kind
       var content:Any
       var stackid:Int?
       var parentid:Int?
       var childid:[Int]
       var childnum:Int
       init(id:Int,type:kind,content:Any,parentid:Int?){
           self.id=id
           self.type=type
           self.content=content
           self.childid=[Int]()
           self.parentid=parentid
           self.stackid=0
           childnum=0
       }
       mutating func createnewchild(childid id:Int){
           self.childid.append(id)
           self.childnum+=1
       }

   }

enum kind:Int,Codable{
 
    case firsttitle
    case secondtitle
    case thirdtitle
    case image
}

class WordFromOutline{
    var id:Int
    var type:kind
    var content:Any
    var parentid:Int?
    init(id:Int,type:kind,content:Any,parentid:Int?){
        self.id=id
        self.content=content
        self.type=type
        self.parentid=parentid
    }
}
