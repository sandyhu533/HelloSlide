//
//  PageView.swift
//  TestforSize3.0
//
//  Created by iOS_Club-29 on 2019/10/1.
//  Copyright © 2019 iOS_Club-29. All rights reserved.
//

import UIKit

class Helloword{
    
    var HellowordData:[PageView]
    
    init(){
        self.HellowordData=[PageView]()
    }
    
    func addNewPage(this rect:CGRect,templateid:Int){
        let templatenow=readtemplatexml(id: templateid)
        let new=PageView(initframe: rect)
        new.initview.tag=1000
        new.initview.backgroundColor=StringtoColor(color: templatenow.backcolor)
        HellowordData.append(new)
    }
    
    func reNewHelloWord(id pageid:Int,datasource data:PageData,templateid:Int){
        deleteoldhelloword(id: pageid)
        let templatenow=readtemplatexml(id: templateid)
        let thispage=self.HellowordData[pageid]
        
        if data.PageData[0].childnum==0{
            let textframe1=createzerofirstkuang(rect: thispage.initframe,type: data.PageData[0].type,tpl: templatenow)
            let view1=addnewcontentandview(inthisframe: textframe1, templatenow: templatenow,data:data.PageData[0])
            thispage.PageCellElments.append(view1)
        }
        else{
            let frame2=createstackview(rect: thispage.initframe, type: .firsttitle, tpl: templatenow)
            let frame3=createsomesubviews(type: .secondtitle, templatenow: templatenow, childnum: data.PageData[0].childnum, inwitchframe:frame2[1])
            let textframe2=createkuang(rect: frame2[0],type: data.PageData[0].type,tpl: templatenow)
            let view2=addnewcontentandview(inthisframe: textframe2, templatenow: templatenow, data: data.PageData[0])
            thispage.PageCellElments.append(view2)

            let contents=data.getAllChild(parentid: 0)
            var i=0
            for x in frame3{
                if contents[i].childnum==0{
                    let frame11=createzerofirstkuang(rect: x, type: .secondtitle, tpl: templatenow)
                    let view11=addnewcontentandview(inthisframe: frame11, templatenow: templatenow, data: contents[i])
                    thispage.PageCellElments.append(view11)

                }
                else{
                    let frame12=createstackview(rect: x, type: .secondtitle, tpl: templatenow)
                    let textframe3=createkuang(rect: frame12[0], type: .secondtitle, tpl: templatenow)
                    let view12=addnewcontentandview(inthisframe: textframe3, templatenow: templatenow, data: contents[i])
                    thispage.PageCellElments.append(view12)
                    let contentss=data.getAllChild(parentid: contents[i].id)
                    
                    if contentss.count==1{
                        let textframe4=createkuang(rect: frame12[1], type: .thirdtitle, tpl: templatenow)
                        let view112=addnewcontentandview(inthisframe: textframe4, templatenow: templatenow, data: contentss[0])
                        thispage.PageCellElments.append(view112)
                    }
                    else{
                        let frame13=createsomesubviews(type: .thirdtitle, templatenow: templatenow, childnum: contents[i].childnum, inwitchframe: frame12[1])

                        var j=0
                        for z in frame13{
                            let textframe5=createkuang(rect: z, type: .thirdtitle, tpl: templatenow)

                            let view113=addnewcontentandview(inthisframe: textframe5, templatenow: templatenow, data: contentss[j])
                            thispage.PageCellElments.append(view113)

                            j+=1
                    }
                    }
                }
                i+=1
            }
        }
        self.HellowordData[pageid].renewPage()
        self.HellowordData[pageid] = thispage
    }
    
    func deleteoldhelloword(id pageid:Int){
        
            self.HellowordData[pageid].PageCellElments.removeAll()
        
    }
    
    func changecolorforall(){
        //选择相应的配色方案并修改全局的配色
    }
    
    func changetemplateonthispage(){
        //修改用id定位到的某一页的布局
    }
}

class PageView:UIView {
    
    var PageCellElments:[UIView]
    var initframe:CGRect
    var initview:UIView
    
    init(initframe:CGRect){
        self.PageCellElments=[UIView]()
        self.initframe=initframe
        self.initview=UIView(frame: initframe)
        super.init(frame: initframe)
        for x in self.PageCellElments{
            self.addSubview(x)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //将elements添加进PageView
    func renewPage(){
        for x in self.subviews{
            if x.tag != 1000{
            x.removeFromSuperview()
            }
        }
        for x in self.PageCellElments{
            self.addSubview(x)
        }
    }
}

func createzerofirstkuang(rect myrect:CGRect,type contenttype:kind,tpl:template)->CGRect{
    var thisframe:CGRect
    switch contenttype{
    case .firsttitle:
        thisframe=StringtoFrame(string: tpl.zerofirstkuang, thisview: myrect)
    case .secondtitle:
        thisframe=StringtoFrame(string: tpl.zerosecondkuang, thisview: myrect)
    case .thirdtitle:
        thisframe=StringtoFrame(string: tpl.zerothirdkuang, thisview: myrect)

        }
    
    return thisframe
}

func createkuang(rect myrect:CGRect,type contenttype:kind,tpl:template)->CGRect{
    var thisframe:CGRect
    switch contenttype{
    case .firsttitle:
        thisframe=StringtoFrame(string: tpl.firstkuang, thisview: myrect)
    case .secondtitle:
        thisframe=StringtoFrame(string: tpl.secondkuang, thisview: myrect)
    case .thirdtitle:
        thisframe=StringtoFrame(string: tpl.thirdkuang, thisview: myrect)

        }
    
    return thisframe
}

func addnewcontentandview(inthisframe myframe:CGRect,templatenow:template,data source:PageNode)->UITextView{
        
    let color=StringtoColor(color: templatenow.fontcolor)
    let tempview=UITextView(frame: myframe)
    tempview.isEditable = false
    let mywidth=myframe.width
    let myheight=myframe.height
    let minfont:CGFloat
    let maxfont:CGFloat
    switch source.type {
    case .firsttitle:
        minfont=CGFloat(Double(templatenow.firstadmirefontmin)!)
        maxfont=CGFloat(Double(templatenow.firstadmirefontmax)!)
    case .secondtitle:
        minfont=CGFloat(Double(templatenow.secondadmirefontmin)!)
        maxfont=CGFloat(Double(templatenow.secondadmirefontmax)!)
    default:
        minfont=CGFloat(Double(templatenow.thirdadmirefontmin)!)
        maxfont=CGFloat(Double(templatenow.thirdadmirefontmax)!)
        
    }
    tempview.attributedText=createAttributedString(text: source.content, type: source.type, font: templatenow.font, width:mywidth , height:myheight, color:color, fontmin:minfont, fontmax:maxfont)
        //参照helloword-version1修改
    tempview.backgroundColor=UIColor.clear
    return tempview
}

func readtemplatexml(id templateid:Int)->template{
return template(backurl: "www.baidu.com", backcolor: "0x000000", fontcolor: "0xffffff", font: "TamilSangamMN", strong: "I", firstsecond: 0.200, firstsecondtype: composingtype.vertical, secondlayout: layoutway.layoutvertical, secondthird: 0.350, secondthirdtype: composingtype.vertical, thirdlayout: layoutway.layoutvertical, equallayout: true, myfontsize: fontsizemode.tosmallest, firstkuang: "300500500300", secondkuang:"100200800600",thirdkuang: "250100500800",zerofirstkuang: "300400400200",zerosecondkuang: "100200800250",zerothirdkuang:"100350800200",firstadmirefontmax: "100.0",firstadmirefontmin: "80.0", secondadmirefontmax: "80.0", secondadmirefontmin: "60.0", thirdadmirefontmax: "60.0", thirdadmirefontmin: "40.0")
}

func StringtoFrame(string str:String,thisview view:CGRect)->CGRect{
    let index1 = str.index(str.startIndex, offsetBy: 0)
    let index2 = str.index(str.startIndex, offsetBy: 3)
    let index3 = str.index(str.startIndex, offsetBy: 6)
    let index4 = str.index(str.startIndex, offsetBy: 9)

    let str1=str[index1..<index2]
    let str2=str[index2..<index3]
    let str3=str[index3..<index4]
    let str4=str[index4...]
    
    let boundx=view.width
    let boundy=view.height
    
    return CGRect(x: boundx*CGFloat(Double(String(str1))!)*0.001+view.origin.x, y: boundy*CGFloat(Double(String(str2))!)*0.001+view.origin.y, width: boundx*CGFloat(Double(String(str3))!)*0.001, height: boundy*CGFloat(Double(String(str4))!)*0.001)
}

func createAttributedString(text mytext:String,type contenttype:kind,font myfont:String,width mywidth:CGFloat,height myheight:CGFloat,color mycolor:UIColor,fontmin min:CGFloat,fontmax max:CGFloat)->NSAttributedString{
    var fontnow=max
    var ParagraphStyle=NSMutableParagraphStyle()
    var linespace:CGFloat{
        return fontnow/32
    }
    var wordspace:CGFloat{
        return fontnow/20
        
    }
    
    ParagraphStyle.lineSpacing=linespace
    
    switch contenttype {
    case .firsttitle:
        ParagraphStyle.alignment = .center
    case .secondtitle:
        ParagraphStyle.alignment = .left
    default:
        ParagraphStyle.alignment = .left
    }
    
    var fonts=UIFont(name: myfont, size: fontnow)!
    
    while true{
        let mysizeheight=getTextHeight(textStr: mytext, font: fonts, width: mywidth, linespace: linespace, wordspace:wordspace )
        if mysizeheight<=myheight{
            break
        }
        else{
            fontnow-=1
        }
        fonts=UIFont(name: myfont, size: fontnow)!
    }
    if fontnow<min{
        print("Too many words!")
    }
    return NSAttributedString(string: mytext, attributes: [NSAttributedString.Key.font:fonts,NSAttributedString.Key.foregroundColor:mycolor,NSAttributedString.Key.paragraphStyle:ParagraphStyle]) //这里再修改一点点
}

func getTextHeight(textStr:String,font:UIFont,width:CGFloat,linespace:CGFloat,wordspace:CGFloat) -> CGFloat {

    let normalText: NSString = textStr as NSString
    let size = CGSize(width: width, height: 10000)
    let ParagraphStyle=NSMutableParagraphStyle()
    ParagraphStyle.lineSpacing=linespace
let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes:[NSAttributedString.Key.font:font,NSAttributedString.Key.kern:wordspace,.paragraphStyle:ParagraphStyle], context:nil).size

    return stringSize.height
}


func StringtoColor(color mycolor:String)->(UIColor){
    let index=mycolor.index(mycolor.startIndex, offsetBy: 2)
    let mycolor=mycolor[index...]
    let rgbValue=Int(mycolor,radix: 16)
    return UIColor(red: ((CGFloat)((rgbValue! & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((rgbValue! & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(rgbValue! & 0xFF)) / 255.0,
                   alpha: 1.0)
    
}
func createstackview(rect drawingonview:CGRect,type contenttype:kind,tpl:template)->[CGRect]{
    var temp:Double
    var templatehengshu:composingtype
    let allheight=drawingonview.height
    let allwidth=drawingonview.width
    
    switch contenttype {
    case .firsttitle:
        temp=tpl.firstsecond
        templatehengshu=tpl.firstsecondtype
       
    case .secondtitle:
        temp=tpl.secondthird
        templatehengshu=tpl.secondthirdtype
       
    default:
        temp=0
        templatehengshu=tpl.firstsecondtype
      
    }
    var stackframe1:CGRect
    var stackframe2:CGRect

    switch templatehengshu {
            case .horizonal:
                stackframe1=CGRect(x: allwidth*CGFloat(temp)+drawingonview.origin.x, y: drawingonview.origin.y, width: allwidth*CGFloat(1-temp), height: allheight)
                stackframe2=CGRect(x: drawingonview.origin.x, y: drawingonview.origin.y, width: allwidth*CGFloat(temp), height: allheight)
    //            nowframe=CGRect(x: allwidth*CGFloat(temp), y: 0, width: allwidth*CGFloat(1-temp), height: allheight)
                //坐标系不对了
            case .vertical:
                stackframe1=CGRect(x: drawingonview.origin.x, y: allheight*CGFloat(temp)+drawingonview.origin.y, width: allwidth, height: allheight*CGFloat(1-temp))
                  stackframe2=CGRect(x: drawingonview.origin.x, y: drawingonview.origin.y, width: allwidth, height: allheight*CGFloat(temp))
            }
    return [stackframe2,stackframe1]
}
func createsomesubviews(type:kind,templatenow:template,childnum nums:Int,inwitchframe:CGRect)->[CGRect]{
    var temp:layoutway
    var rects=[CGRect]()
    
    switch type {
    case .secondtitle:
        temp=templatenow.secondlayout
    default:
        temp=templatenow.thirdlayout
    }
    
    switch temp {
    case .layouthorizonal:
        let perwidth=inwitchframe.width/CGFloat(nums)
        for i in 0..<nums{
            rects.append(CGRect(x: inwitchframe.origin.x+CGFloat(i)*perwidth, y: inwitchframe.origin.y, width: perwidth, height: inwitchframe.height))
        }
    default:
        let perheight=inwitchframe.height/CGFloat(nums)
        for i in 0..<nums{
            rects.append(CGRect(x: inwitchframe.origin.x, y: inwitchframe.origin.y+CGFloat(i)*perheight, width: inwitchframe.width, height: perheight))
        }
    }
    return rects
}
