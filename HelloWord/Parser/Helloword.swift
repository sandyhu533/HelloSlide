//
//  PageCellElement.swift
//  DrawShape
//
//  Created by iOS_Club-29 on 2019/10/11.
//  Copyright © 2019 iOS_Club-29. All rights reserved.
//

import UIKit

class Helloword{
    
    //Page是一个模版的每一页
    var HellowordData: [Page]?
    
    var initframe = CGRect(origin: CGPoint.zero, size: CGSize.zero)
    
    init(frame:CGRect){
        HellowordData = [Page]()
        self.initframe = frame
    }
    
    func addNewPage(color:UIColor) {   //这里可能之后要加一个写文件操作
        let newpageview = PageView(initframe: self.initframe, color: color)
        let newpage = Page()
        let tempimage = UIImageView(image: UIImage(fromView: newpageview))
        newpage.addSlide(tempimage)
        HellowordData!.append(newpage)
    }
    
    func reNewHellowordFluid(id pageid:Int,datasource data:PageData,colorid:Int){
        //获得模版、新建一个slide
    
        self.deleteoldhelloword(pageids: pageid)
        let templatenow = readFromFluidTemplate()
        let thispage = PageView(initframe: self.initframe, color: templatenow.backcolor.hexcolor)
        
        //判断是否有图片
        let images = data.getImages()
        let isthereimage = images.count == 0 ? false : true
        let firstnodes = data.getFirstTitles()
        let firstnum = isthereimage ? firstnodes.count+1 : firstnodes.count
        
        let frame0 = createsomesubviews(type: .firsttitle, templatenow: templatenow, childnum: firstnum, inwitchframe: thispage.initframe)

        
        //首先排版文字，文字按照每个一级标题为一颗树，依次排版下去
        for i in 0..<firstnodes.count{

            
            let firstnode = firstnodes[i]
            layoutText(in: firstnode, myslide: thispage, datasource: data,frame: frame0[i])
        }
        
        //如果有图片，则排版图片
        if(isthereimage){
            let imageframe = frame0[firstnum-1]
            layoutImages(images: images, frame: imageframe, in: thispage)
        }
        
        //刷新数组，换成我们新建的slide
        let image = UIImage(fromView: thispage)
        let imageview = UIImageView(image: image)
        self.HellowordData![pageid].addSlide(imageview)
        //self.HellowordData[pageid].OriginalSlideViews[0] = thispage
    }
    
    func reNewHellowordFixed(composings mycomposing:[Composing],datasource data:PageData,in pageid:Int){
        self.deleteoldhelloword(pageids: pageid)
        if(mycomposing.count != 0){
        for compose in mycomposing{
            let thispage = PageView(initframe: self.initframe, color: UIColor.white)
            let colorthree = compose.textcolor
            var mycolors=[String]()
            if let color = colorthree{
                mycolors=color.get8array
            }
            if(mycolors.count != 3){
                return
            }
            let bgimage = UIImage(data: compose.bgpic!)
            thispage.drawnewbg(pic: bgimage!)
            thispage.drawImages(positions: compose.imageposition, sourceImages: data.getImages())
            thispage.drawText(positions: compose.firstposition, texts: data.getFirstTitles(), font: compose.font, color: mycolors[0])
            thispage.drawText(positions: compose.secondposition, texts: data.getSecondTitles(), font: compose.font, color:mycolors[1] )
            thispage.drawText(positions: compose.thirdposition, texts: data.getThirdTitles(), font: compose.font, color:mycolors[2])
            
            thispage.renewPage()

            
            let image = UIImage(fromView: thispage)
            let imageview = UIImageView(image: image)
            self.HellowordData![pageid].addSlide(imageview)
            
        }
        }
        else{
            reNewHellowordFluid(id: pageid, datasource: data, colorid: 0)
        }
    }
    
    //好像不用全部都remove，直接令它等于新的就好啦
    func deleteoldhelloword(pageids pageid:Int){
        
        if HellowordData != nil{
            self.HellowordData![pageid].singleSlideViews.removeAll()
        }
        
    }
    
    //以一级标题为根，排版文字
    func layoutText(in firstnode:PageNode,myslide thispage:PageView,datasource data:PageData,frame thisframe:CGRect){
        let templatenow=readFromFluidTemplate()
        
        if firstnode.childnum==0{
            let textframe1=createzerofirstkuang(rect: thisframe,type: firstnode.type,tpl: templatenow)
            let view1=addnewcontentandview(inthisframe: textframe1, templatenow,data:firstnode)
            thispage.PageCellElments.append(view1)
        }
        else{
            let frame2=createstackview(rect: thisframe, type: .firsttitle, tpl: templatenow)
            let frame3=createsomesubviews(type: .secondtitle, templatenow: templatenow, childnum: firstnode.childnum, inwitchframe:frame2[1])
            let textframe2=createkuang(rect: frame2[0],type: firstnode.type,tpl: templatenow)
            let view2=addnewcontentandview(inthisframe: textframe2, templatenow, data: firstnode)
            thispage.PageCellElments.append(view2)

            let contents=data.getallchild(parentid: firstnode.id)
            var i=0
            for x in frame3{
                if contents[i].childnum==0{
                    let frame11=createzerofirstkuang(rect: x, type: .secondtitle, tpl: templatenow)
                    let view11=addnewcontentandview(inthisframe: frame11, templatenow, data: contents[i])
                    thispage.PageCellElments.append(view11)

                }
                else{
                    let frame12=createstackview(rect: x, type: .secondtitle, tpl: templatenow)
                    let textframe3=createkuang(rect: frame12[0], type: .secondtitle, tpl: templatenow)
                    let view12=addnewcontentandview(inthisframe: textframe3, templatenow, data: contents[i])
                    thispage.PageCellElments.append(view12)
                    let contentss=data.getallchild(parentid: contents[i].id)
                    
                    if contentss.count==1{
                        let textframe4=createkuang(rect: frame12[1], type: .thirdtitle, tpl: templatenow)
                        let view112=addnewcontentandview(inthisframe: textframe4, templatenow, data: contentss[0])
                        thispage.PageCellElments.append(view112)
                    }
                    else{
                        let frame13=createsomesubviews(type: .thirdtitle, templatenow: templatenow, childnum: contents[i].childnum, inwitchframe: frame12[1])

                        var j=0
                        for z in frame13{
                            let textframe5=createkuang(rect: z, type: .thirdtitle, tpl: templatenow)

                            let view113=addnewcontentandview(inthisframe: textframe5, templatenow, data: contentss[j])
                            thispage.PageCellElments.append(view113)

                            j+=1
                    }
                    }
                }
                i+=1
            }

    }
    }
    
    // 图片排版
    func layoutImages(images myimages:[PageNode],frame myframe:CGRect,in page:PageView){
        if myimages.count==1{
            let image = (myimages[0].content as! UIImage)
            let nowframe = getProperSize(originalPic: image.size, ProperOutline: myframe)
            let newview = UIImageView(image: (image))
            newview.frame = nowframe
            page.PageCellElments.append(newview)
        }
        else{
            if(myframe.width>myframe.height){
                let width = myframe.width/CGFloat(myimages.count)
                var i = 0
                for x in myimages{
                    let frame = CGRect(x: myframe.minX+CGFloat(i)*width, y: myframe.minY, width: width, height: myframe.height)
                    let image = (x.content as! UIImage).apply(padding: width*0.048)
                    let newview = UIImageView(image: image)
                    newview.frame = frame
                    page.PageCellElments.append(newview)
                    i=i+1
                }
            }
            else{
                let height = myframe.height/CGFloat(myimages.count)
                var j = 0
                for x in myimages{
                    let frame = CGRect(x: myframe.minX, y: myframe.minY+height*CGFloat(j), width: height, height: myframe.width)
                    let image = (x.content as! UIImage).apply(padding: height*0.048)
                    let newview = UIImageView(image:image )
                    newview.frame = frame
                    page.PageCellElments.append(newview)
                    j=j+1
                }
            }
        }
    }
        
}

class Page{
    
    //一个模版的多个排版方案
    var singleSlideViews = [UIImageView]()
    
    var currentSlideIndex = 0
    
    var lastSlideIndex = 0
    
    // 模板个数
    func countSlides()->Int {
        return singleSlideViews.count
    }
    
    // 添加Slide
    func addSlide(_ newSlide:UIImageView) {
        singleSlideViews.append(newSlide)
    }
    
    func slideAddOne(){
        if(self.currentSlideIndex+1<=self.singleSlideViews.count-1){
        self.currentSlideIndex+=1
        }
    }
    func getSlideNumber()->Int{
        return self.currentSlideIndex
    }
    
}

//PageView是包含所有元素的集合，转成Page之后才能被slideView用
class PageView:UIView {
    
    //文字框
    var PageCellElments:[UIView]
    
    //背景图
    var bgview:UIView
    
    //用于初始化的框的frame
    var initframe:CGRect
    
    init(initframe:CGRect,color:UIColor){
        self.initframe = initframe
        self.PageCellElments=[UIView]()
        //self.bgcolor = color
        self.bgview=UIView(frame: initframe)
        self.bgview.tag = 1000
        self.bgview.backgroundColor = color
        super.init(frame: initframe)
        self.addSubview(bgview)
    }
    
  required init?(coder aDecoder: NSCoder) {
    self.PageCellElments = [UIView]()
    self.bgview = UIView()
    self.initframe = CGRect()
    super.init(coder: aDecoder)
    }
    
    //将elements添加进PageView
    func renewPage(){
        for x in self.subviews{
            x.removeFromSuperview()
            
        }
        self.addSubview(self.bgview)
        for x in self.PageCellElments{
            self.addSubview(x)
        }
        self.setNeedsLayout()
    }
    //现在需要一个函数，它读入模版，根据模版去create
    //根据当前的frame把模版的颜色等等都初始化，但是现在要做的确实是这样一件事情
        //这里可能添加读写图片数据
    
    //大致就是从数据库里面取图片依次放上去啦
    func drawImages(positions:String?,sourceImages:[PageNode]){
        if let positions = positions{
        let positions = positions.get12array
        for i in 0..<sourceImages.count{
            let position = positions[i]
            let image = sourceImages[i].content as! UIImage
            let temp = CGRect(x: position.x, y: position.y, width: position.width, height: position.height)
            let framenow = getProperSize(originalPic:image.size , ProperOutline: temp)
//            newimageview.frame = CGRect(x: position.x * self.initframe.width+self.initframe.minX, y: position.y * self.initframe.height+self.initframe.minY, width: position.width * self.initframe.width, height: position.height * self.initframe.height)
            let newimageview = UIImageView(image: image)
            newimageview.frame = framenow
            self.PageCellElments.append(newimageview)
        }
        }
    }

    func drawText(positions:String?,texts:[PageNode],font:String?,color:String?){
        if let positions = positions{
            if let font = font{
                if let color = color{
        let positionarray = positions.get12array
        for i in 0..<texts.count{
            let myposition = positionarray[i]
            let text = texts[i]
            let width = self.initframe.width * myposition.width
            let height = self.initframe.height * myposition.height
            let attritext = createAttributedString(text: text.content as! String, type: text.type, font: font, width:width , height: height, color: color.hexcolor, fontmin: 20, fontmax: 100)
            let newtextview = UITextView()
            newtextview.frame = CGRect(x: myposition.x * self.initframe.width+self.initframe.minX, y: myposition.y * self.initframe.height+self.initframe.minY, width:width, height: height)
        
            // TODO: 背景色
            newtextview.backgroundColor = UIColor.clear
            
            newtextview.attributedText  = attritext
            self.PageCellElments.append(newtextview)
                    }
        }
            }
        }
        
    }
    func drawnewbg(pic:UIImage){
        self.bgview = UIImageView(image: pic)
        self.bgview.frame = self.initframe
        
    }

    
}


func createzerofirstkuang(rect myrect:CGRect,type contenttype:kind,tpl:FluidTemplate)->CGRect{
    var thisframe:CGRect
    switch contenttype{
    case .firsttitle:
        thisframe=StringtoFrame(string: tpl.zerofirstkuang, thisview: myrect)
    case .secondtitle:
        thisframe=StringtoFrame(string: tpl.zerosecondkuang, thisview: myrect)
    case .thirdtitle:
        thisframe=StringtoFrame(string: tpl.zerothirdkuang, thisview: myrect)
    default:
        thisframe=StringtoFrame(string: tpl.zerofirstkuang, thisview: myrect)


        }
    
    return thisframe
}

func createkuang(rect myrect:CGRect,type contenttype:kind,tpl:FluidTemplate)->CGRect{
    var thisframe:CGRect
    switch contenttype{
    case .firsttitle:
        thisframe=StringtoFrame(string: tpl.firstkuang, thisview: myrect)
    case .secondtitle:
        thisframe=StringtoFrame(string: tpl.secondkuang, thisview: myrect)
    case .thirdtitle:
        thisframe=StringtoFrame(string: tpl.thirdkuang, thisview: myrect)
    default:
        thisframe=StringtoFrame(string: tpl.firstkuang, thisview: myrect)
        }
    
    return thisframe
}

func addnewcontentandview(inthisframe myframe:CGRect,_ templatenow:FluidTemplate,data source:PageNode)->UITextView{
        
    let color=templatenow.fontcolor.hexcolor
    let tempview=UITextView(frame: myframe)
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
    tempview.attributedText=createAttributedString(text: source.content as! String, type: source.type, font: templatenow.font, width:mywidth , height:myheight, color:color, fontmin:minfont, fontmax:maxfont)
        //参照helloword-version1修改
    tempview.isScrollEnabled = false
    tempview.backgroundColor=UIColor.clear
    //内容缩进为0（去除左右边距）
    tempview.textContainer.lineFragmentPadding = 0
    //文本边距设为0（去除上下边距）
    tempview.textContainerInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    //tempview.backgroundColor = UIColor.yellow
    return tempview
}

func readFromFluidTemplate()->FluidTemplate{
    return FluidTemplate(backurl: "www.baidu.com", backcolor: "0x000000", fontcolor: "0xffffff", font: "TamilSangamMN", strong: "I",firstlayout: layoutway.layoutvertical, firstsecond: 0.300, firstsecondtype: composingtype.vertical, secondlayout: layoutway.layoutvertical, secondthird: 0.350, secondthirdtype: composingtype.vertical, thirdlayout: layoutway.layoutvertical, equallayout: true, myfontsize: fontsizemode.tosmallest, firstkuang: "250200500800", secondkuang:"100200800800",thirdkuang: "250100500800",zerofirstkuang: "300400400200",zerosecondkuang: "100300800300",zerothirdkuang:"100350800200",firstadmirefontmax: "100.0",firstadmirefontmin: "80.0", secondadmirefontmax: "80.0", secondadmirefontmin: "60.0", thirdadmirefontmax: "60.0", thirdadmirefontmin: "40.0")
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
    case .thirdtitle:
        ParagraphStyle.alignment = .left
        
    default:
        ParagraphStyle.alignment = .left
    }
    
    var fonts=UIFont(name: myfont, size: fontnow)!
    var mysizeheight:CGFloat = 0
    let mysizewidth:CGFloat = 0
   // let paddding = CGFloat(50)
    var padding = 0
    if(mytext.count < 100){
        padding = 30
    }else{
        if(mywidth>myheight){
            padding = 30
        }else{
            padding = 50
        }
    }
    let wantheight = myheight - CGFloat(padding)
    print("*******Width*********\(mywidth)")
    print("*******Height*********\(wantheight)")

    while true{
        mysizeheight=getTextHeight(textStr: mytext, font: fonts, width: mywidth, linespace: linespace, wordspace:wordspace )
//        mysizewidth = getTextWidth(textStr: mytext, font: fonts, height: myheight, linespace: linespace, wordspace:wordspace )
//        print("mysizeheight\(mysizeheight)")
//        print("mysizewidth\(mysizewidth)")
//
        if mysizeheight<=wantheight{
            if(mysizewidth<=mywidth){
            break
            }
        }
        else{
            fontnow-=1
        }
        fonts=UIFont(name: myfont, size: fontnow)!
    }
//    if fontnow<min{
//        print("Too many words!")
//    }
    //print("fontnow\(fontnow)")
    //print("computingheight\(mysizeheight)")
    //print("originalsize\(myheight)")
    //print("fontnow\(fontnow)")
    return NSAttributedString(string: mytext, attributes: [NSAttributedString.Key.font:fonts,NSAttributedString.Key.foregroundColor:mycolor,NSAttributedString.Key.paragraphStyle:ParagraphStyle]) //这里再修改一点点
}

func getTextHeight(textStr:String,font:UIFont,width:CGFloat,linespace:CGFloat,wordspace:CGFloat) -> CGFloat {

    let normalText: NSString = textStr as NSString
    let size1 = CGSize(width: width, height: 10000)
    let ParagraphStyle=NSMutableParagraphStyle()
    ParagraphStyle.lineSpacing=linespace
let stringSize = normalText.boundingRect(with: size1, options: .usesLineFragmentOrigin, attributes:[NSAttributedString.Key.font:font,NSAttributedString.Key.kern:wordspace,.paragraphStyle:ParagraphStyle], context:nil).size
    
    

    return stringSize.height
}
func getTextWidth(textStr:String,font:UIFont,height:CGFloat,linespace:CGFloat,wordspace:CGFloat) -> CGFloat {

    let normalText: NSString = textStr as NSString
    let size1 = CGSize(width: 100000, height: height)
    let ParagraphStyle=NSMutableParagraphStyle()
    ParagraphStyle.lineSpacing=linespace
let stringSize = normalText.boundingRect(with: size1, options: .usesLineFragmentOrigin, attributes:[NSAttributedString.Key.font:font,NSAttributedString.Key.kern:wordspace,.paragraphStyle:ParagraphStyle], context:nil).size
    
    

    return stringSize.width
}



func createstackview(rect drawingonview:CGRect,type contenttype:kind,tpl:FluidTemplate)->[CGRect]{
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
//            default:
//                stackframe1=CGRect(x:0,y:0,width:allwidth,height: allheight)
//                stackframe2=CGRect(x: 0, y: 0, width: allwidth, height: allheight)

            }
    return [stackframe2,stackframe1]
}
func createsomesubviews(type:kind,templatenow:FluidTemplate,childnum nums:Int,inwitchframe:CGRect)->[CGRect]{
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


func getProperSize(originalPic pic:CGSize,ProperOutline outline:CGRect)->CGRect{
    let pi1 = (pic.height)/(pic.width)
    let pi2 = (outline.height)/(outline.width)
    var res = CGRect()
    if(pi1>pi2){
        let nowheight = outline.height
        let nowwidth = nowheight/pi1
        let dx = (outline.width-nowwidth)/2
        res = CGRect(x: outline.minX+dx, y: outline.minY, width: nowwidth, height: nowheight)
    }
    else{
        let nowwidth = outline.width
        let nowheight = nowwidth*pi1
        let dy = (outline.height-nowheight)/2
        res = CGRect(x: outline.minX, y: outline.minY+dy, width: nowwidth, height: nowheight)
    }
    return res
}

