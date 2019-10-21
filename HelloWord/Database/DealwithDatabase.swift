//
//  AddDatabase.swift
//  HelloWord
//
//  Created by iOS_Club-29 on 2019/10/15.
//  Copyright © 2019 HelloWord. All rights reserved.
//

import Foundation
import UIKit
import CoreData




func ifExists(instanceid id:Int)->Bool{
    let app = UIApplication.shared.delegate as! AppDelegate
    let context = app.persistentContainer.viewContext
     
    //声明数据的请求
    let fetchRequest = NSFetchRequest<Composing>(entityName:"Composing")
    //fetchRequest.fetchLimit = 10 //限定查询结果的数量
    fetchRequest.fetchOffset = 0 //查询的偏移量
     
    //设置查询条件
    let requestString:String = "composingid = \(id)"
    let predicate = NSPredicate(format: requestString, "")
    fetchRequest.predicate = predicate
     
    //查询操作
    do {
        let fetchedObjects = try context.fetch(fetchRequest)
        if(fetchedObjects.count == 0){
            return false
        }
        else{
            return true
        }
        
    }
    catch {
        fatalError("查询失败：\(error)")
    }
}


func findMatchedComposeing(pageinfo info:Int16,templateid tpl:Int,colorid clid:Int)->[Composing]{
    let app = UIApplication.shared.delegate as! AppDelegate
    let context = app.persistentContainer.viewContext
     
    //声明数据的请求
    let fetchRequest = NSFetchRequest<Composing>(entityName:"Composing")
    //fetchRequest.fetchLimit = 10 //限定查询结果的数量
    fetchRequest.fetchOffset = 0 //查询的偏移量
     
    //设置查询条件
    let requestString:String = "pageinfo = \(info)"
    let predicate = NSPredicate(format: requestString, "")
    fetchRequest.predicate = predicate
    
    var res=[Composing]()
    
    do {
        let fetchedObjects = try context.fetch(fetchRequest)
        for x in fetchedObjects{
            if x.composingid>tpl*1000 && x.composingid<(tpl+1)*1000{
                let temp = x.composingid%1000
                if (temp%5 == clid){
                    res.append(x)
                }
                
            }
            print("*******取到了一个模版**********")
        }
    }
    catch {
        fatalError("查询失败：\(error)")
    }
    return res
}

func deleteobject(pageinfo info:Int){
    let app = UIApplication.shared.delegate as! AppDelegate
    let context = app.persistentContainer.viewContext
    
    //声明数据的请求
    let fetchRequest = NSFetchRequest<Composing>(entityName:"Composing")
    //fetchRequest.fetchLimit = 10 //限定查询结果的数量
    fetchRequest.fetchOffset = 0 //查询的偏移量
    
    //设置查询条件
    let requestString:String = "composingid = \(info)"
    let predicate = NSPredicate(format: requestString, "")
    fetchRequest.predicate = predicate
    
    //查询操作
    do {
        let fetchedObjects = try context.fetch(fetchRequest)
        for x in fetchedObjects{
            context.delete(x)
        }
        
    }
    catch {
        fatalError("查询失败：\(error)")
    }
    try! context.save()
}
func addComposingToDatabase(_ pageinfo:Int,composingid:Int,bgpic:UIImage,firstposition:String,secondposition:String,thirdposition:String,imageposition:String,font:String,color:String){
    //获取管理的数据上下文 对象
    let app = UIApplication.shared.delegate as! AppDelegate
    let context = app.persistentContainer.viewContext
    
    if(ifExists(instanceid:composingid)){
        print("加入失败，请不要重复加入")
        return
    }
    //创建User对象
    let compose = NSEntityDescription.insertNewObject(forEntityName: "Composing",
                                                      into: context) as! Composing
    
    //检查颜色是否是18位的字符串，由0x222222组成
    if(color.get8array.count != 3){
        print("加入失败，颜色出错")
        return
    }
    //检查插入的位置是否是12的倍数
    if(firstposition.count%12 != 0 || secondposition.count%12 != 0 || thirdposition.count%12 != 0 || imageposition.count%12 != 0){
        print("加入失败，位置出错")
        return
    }
    
    compose.pageinfo = Int16(pageinfo)
    compose.bgpic = bgpic.toData
    compose.composingid = Int16(composingid)
    compose.firstposition = firstposition
    compose.secondposition = secondposition
    compose.thirdposition = thirdposition
    compose.imageposition = imageposition
    compose.font = font
    compose.textcolor = color
    //保存
    do {
        try context.save()
        print("保存成功！")
    } catch {
        fatalError("不能保存：\(error)")
    }
    
}
