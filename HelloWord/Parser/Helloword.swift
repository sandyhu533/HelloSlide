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
    
    let mycolors:[UIColor] = [UIColor.asparagus(),UIColor.blush(),UIColor.burntSienna(),UIColor.sepia(),UIColor.eggplant(),UIColor.fern(),UIColor.maroon(),UIColor.denim()]
    let mycolorlength = 8
    
//    let fontfamily = ["Helvetica","Courier","ArialHebrew","Verdana","ArialHebrew","HelveticaNeue"]
    
//    //I001003
//    I002001
//    I003007
//    I004002
//    I005010

    let picfamily = ["","i001012","i002013","i003006","i004007","i005013","","i001012","","i103006","i004007","005bg2","","i001012","","i103006","i004007","005bg3"]
    
    // 默认晨曦是从第6套模版开始添加,依次往后排序
//    let picfamily2 = ["i006000","i006001","i006002","i006003","i006004","i006005","i006006","i006007","i006008","i006009","i006010","i006011","i006012","i006013","i006014","i006015","i006016","i007000","i007001","i007002","i007003","i007004","i007005","i007006","i007007","i007008","i007009","i007010","i007011","i007012","i007013","i007014","i007015","i008000","i008001","i008002","i008003","i008004","i008005","i008006","i008007","i008008","i008009","i008010","i008011","i008012","i008013","i008014","i008015","i008016","i008017","i009000","i009001","i009002","i009003","i009004","i009005","i009006","i009007","i009008","i009009","i009010","i009011","i009012","i009013","i009014","i009015","i010000","i010001","i010002","i010003","i010004","i010005","i010006","i010007","i010008","i010009","i010010","i010011","i010012","i010013","i010014","i010015","i010016","i010017","i010018","i010019","i011000","i011001","i011002","i011003","i011004","i011005","i011006","i011007","i011008","i011009","i011010","i011011","i011012","i012000","i012001","i012002","i012003","i012004","i012005","i012006","i012007","i012008","i012009","i012010","i012011","i012012","i012013","i012014","i012015","i012016","i012017","i012018","i013000","i013001","i013002","i013003","i013004","i013005","i013006","i013007","i013008","i013009","i013010","i013011","i014000","i014001","i014002","i014003","i014004","i014005","i014006","i014007","i014008","i014009","i014010","i014011","i014012","i014013","i014014","i014015","i014016","i014017","i014018","i015000","i015001","i015002","i015003","i015004","i015005","i015006","i015007","i015008","i015009","i016000","i016001","i016002","i016003","i016004","i016005","i016006","i016007","i016008","i016009","i016010","i016011","i016012","i016013","i016014","i016015","i016016","i017000","i017001","i017002","i017003","i017004","i017005","i017006","i017007","i017008","i017009","i017010","i017011","i017012","i017013","i017014","i017015","i017016","i017017","i017018","i017019","i018000","i018001","i018002","i018003","i018004","i018005","i018006","i018007","i018008","i018009","i018010","i018011","i018012","i019000","i019001","i019002","i019003","i019004","i019005","i019006","i019007","i019008","i019009","i019010","i019011","i019012","i019013","i020000","i020001","i020002","i020003","i020004","i020005","i020006","i020007","i020008","i020009","i020010","i020011","i020012","i020013","i020014","i020015","i020016"];
    
    let picfamily2 = ["i006000","i007000","i008000","i009000","i010000","i011000","i012000","i013000","i014000","i015000","i016000","i017000","i018000","i019000","i020000"];
    
   // let fontcolor = ["","0xffffff","0x000000","0x000000","0x000000","0xB7251E"]
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
    
    func reNewHellowordFluid(id pageid:Int,datasource data:PageData,colorid:Int,templateid:Int){
        //获得模版、新建一个slide
        var realid = 0
        realid = colorid % self.mycolorlength
        
        // LR ： 这里删去了过去的显示数组
        self.deleteoldhelloword(pageids: pageid)
        let templatenow = readFromFluidTemplate()
        let thispage : PageView
        
        if(templateid == 0){
            thispage = PageView(initframe: self.initframe, color: self.mycolors[realid])
        }
        else if(templateid <= 5){
            // MARK : 这里需要二次修改一下
            let temp = colorid % 3
            let bgpic = self.picfamily[templateid+temp*6]
            thispage = PageView(initframe: self.initframe, image: bgpic)
        }
        else{
            var bgpic : String
            if (templateid-6 < picfamily2.count) {
                bgpic = self.picfamily2[templateid-6]
            } else {
                bgpic = "i006000"
            }
            thispage = PageView(initframe: self.initframe, image: bgpic)

        }
        
        //判断是否有图片
        let images = data.getImages()
        let isthereimage = images.count == 0 ? false : true
        let firstnodes = data.getFirstTitles()
        let firstnum = isthereimage ? firstnodes.count+1 : firstnodes.count
        
        let frame0 = createsomesubviews(type: .firsttitle, templatenow: templatenow, childnum: firstnum, inwitchframe: thispage.initframe)

        
        //首先排版文字，文字按照每个一级标题为一颗树，依次排版下去
        for i in 0..<firstnodes.count{

            
            let firstnode = firstnodes[i]
            layoutText(in: firstnode, myslide: thispage, datasource: data,frame: frame0[i], tplid: templateid)
        }
        
        //如果有图片，则排版图片
        if(isthereimage){
            let imageframe = frame0[firstnum-1]
            layoutImages(images: images, frame: imageframe, in: thispage)
        }
        
        modifyTotheSameSize(mypage: thispage)
        //刷新数组，换成我们新建的slide
        thispage.renewPage()
        let image = UIImage(fromView: thispage)
        let imageview = UIImageView(image: image)
        self.HellowordData![pageid].addSlide(imageview)
        //self.HellowordData[pageid].OriginalSlideViews[0] = thispage
       
    }
    
    func reNewHellowordFixed(composings mycomposing:[Composing],datasource data:PageData,in pageid:Int,colorid:Int,templateid:Int){
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
            let size1 = thispage.drawText(positions: compose.firstposition, texts: data.getFirstTitles(), font: compose.font, color: mycolors[0], lastsize: 100000)
            let size2 = thispage.drawText(positions: compose.secondposition, texts: data.getSecondTitles(), font: compose.font, color:mycolors[1], lastsize: size1)
            _ = thispage.drawText(positions: compose.thirdposition, texts: data.getThirdTitles(), font: compose.font, color:mycolors[2],lastsize: size2)
            
            thispage.renewPage()

            
            let image = UIImage(fromView: thispage)
            let imageview = UIImageView(image: image)
            self.HellowordData![pageid].addSlide(imageview)
            
        }
        }
    }
        
    
    func deleteoldhelloword(pageids pageid:Int){
        
        if HellowordData != nil{
            self.HellowordData![pageid].singleSlideViews.removeAll()
            self.HellowordData![pageid].currentSlideIndex = 0
            self.HellowordData![pageid].lastSlideIndex = 0
        }
        
    }
    
    //以一级标题为根，排版文字
    func layoutText(in firstnode:PageNode,myslide thispage:PageView,datasource data:PageData,frame thisframe:CGRect,tplid:Int){
        let templatenow=readFromFluidTemplate()
        
        if firstnode.childnum==0{
            let textframe1=createzerofirstkuang(rect: thisframe,type: firstnode.type,tpl: templatenow)
            let view1=addnewcontentandview(inthisframe: textframe1, templatenow,data:firstnode, tplid: tplid)
            view1.tag = 10000
            thispage.PageCellElments.append(view1)
        }
        else{
            let frame2=createstackview(rect: thisframe, type: .firsttitle, tpl: templatenow)
            let frame3=createsomesubviews(type: .secondtitle, templatenow: templatenow, childnum: firstnode.childnum, inwitchframe:frame2[1])
            let textframe2=createkuang(rect: frame2[0],type: firstnode.type,tpl: templatenow)
            let view2=addnewcontentandview(inthisframe: textframe2, templatenow, data: firstnode, tplid: tplid)
            view2.tag = 10000
            thispage.PageCellElments.append(view2)

            let contents=data.getallchild(parentid: firstnode.id)
            var i=0
            for x in frame3{
                if contents[i].childnum==0{
                    let frame11=createzerofirstkuang(rect: x, type: .secondtitle, tpl: templatenow)
                    let view11=addnewcontentandview(inthisframe: frame11, templatenow, data: contents[i], tplid: tplid)
                    view11.tag = 20000
                    thispage.PageCellElments.append(view11)

                }
                else{
                    let frame12=createstackview(rect: x, type: .secondtitle, tpl: templatenow)
                    let textframe3=createkuang(rect: frame12[0], type: .secondtitle, tpl: templatenow)
                    let view12=addnewcontentandview(inthisframe: textframe3, templatenow, data: contents[i], tplid: tplid)
                    view12.tag = 20000
                    thispage.PageCellElments.append(view12)
                    let contentss=data.getallchild(parentid: contents[i].id)
                    
                    if contentss.count==1{
                        let textframe4=createkuang(rect: frame12[1], type: .thirdtitle, tpl: templatenow)
                        let view112=addnewcontentandview(inthisframe: textframe4, templatenow, data: contentss[0], tplid: tplid)
                        view112.tag = 30000
                        thispage.PageCellElments.append(view112)
                    }
                    else{
                        let frame13=createsomesubviews(type: .thirdtitle, templatenow: templatenow, childnum: contents[i].childnum, inwitchframe: frame12[1])

                        var j=0
                        for z in frame13{
                            let textframe5=createkuang(rect: z, type: .thirdtitle, tpl: templatenow)

                            let view113=addnewcontentandview(inthisframe: textframe5, templatenow, data: contentss[j], tplid: tplid)
                            view113.tag = 30000
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
            let (nowimage,origin) = getProperSize(originalPic: image, ProperOutline: myframe)
            let newview = UIImageView(image: (nowimage))
            newview.frame.origin = origin
            print("********Image has been appended!**********\(newview.frame)")
            page.PageCellElments.append(newview)
        }
        else{
            if(myframe.width>myframe.height){
                let width = myframe.width/CGFloat(myimages.count)
                var i = 0
                for x in myimages{
                    let myframe = CGRect(x: myframe.minX+CGFloat(i)*width, y: myframe.minY, width: width, height: myframe.height)
                    let image = (x.content as! UIImage)
                    let (nowimage,origin) = getProperSize(originalPic: image, ProperOutline: myframe)
                    let newview = UIImageView(image: (nowimage))
                    newview.frame.origin = origin
                    print("********Image has been appended!**********\(newview.frame)")
                    page.PageCellElments.append(newview)
                    i=i+1
                }
            }
            else{
                let height = myframe.height/CGFloat(myimages.count)
                var j = 0
                for x in myimages{
                    let myframe = CGRect(x: myframe.minX, y: myframe.minY+height*CGFloat(j), width: height, height: myframe.width)
                    let image = (x.content as! UIImage)
                    let (nowimage,origin) = getProperSize(originalPic: image, ProperOutline: myframe)
                    let newview = UIImageView(image: (nowimage))
                    newview.frame.origin = origin
                    print("********Image has been appended!**********\(newview.frame)")
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
    init(initframe:CGRect,image:String){
        let path1 = Bundle.main.path(forResource: image, ofType: "png")
        let path2 = Bundle.main.path(forResource: image, ofType: "jpg")
        let path3 = Bundle.main.path(forResource: image, ofType: "PNG")
        let path4 = Bundle.main.path(forResource: image, ofType: "JPG")

        var newImage : UIImage? = nil
        if let path = path1 {
            newImage = UIImage(contentsOfFile: path)
        }
        if let path = path1 {
            newImage = UIImage(contentsOfFile: path)
        }
        if let path = path1{
            newImage = UIImage(contentsOfFile: path)
        }
        if let path = path1{
            newImage = UIImage(contentsOfFile: path)
        }
        
        
        self.initframe = initframe
        self.PageCellElments=[UIView]()
        //self.bgcolor = color
        self.bgview=UIImageView(image: newImage)
        self.bgview.frame = initframe
        self.bgview.tag = 1000
       
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
            let temp = CGRect(x: position.x * self.initframe.width+self.initframe.minX, y: position.y * self.initframe.height+self.initframe.minY, width: position.width * self.initframe.width, height: position.height * self.initframe.height)
            let (imagenow,origin) = getProperSize(originalPic:image, ProperOutline: temp)
//            newimageview.frame = CGRect(x: position.x * self.initframe.width+self.initframe.minX, y: position.y * self.initframe.height+self.initframe.minY, width: position.width * self.initframe.width, height: position.height * self.initframe.height)
            let newimageview = UIImageView(image: imagenow)
            newimageview.frame.origin = origin
            self.PageCellElments.append(newimageview)
        }
        }
    }

    func drawText(positions:String?,texts:[PageNode],font:String?,color:String?,lastsize:CGFloat)->CGFloat{
        var mysize:CGFloat = 100000
        if let positions = positions{
            if let font = font{
                if let color = color{
        let positionarray = positions.get12array
                    
                    var tempviews = [UITextView]()
        for i in 0..<texts.count{
            let myposition = positionarray[i]
            let text = texts[i]
            let width = self.initframe.width * myposition.width
            let height = self.initframe.height * myposition.height
            let (attris,size) = createAttributedStringandSize(text: text.content as! String, type: text.type, font: font, width:width , height: height, color: color.hexcolor, fontmin: 20, fontmax: 100)
            if(size < mysize){
                mysize = size
            }
            let newtextview = UITextView()
            newtextview.frame = CGRect(x: myposition.x * self.initframe.width+self.initframe.minX, y: myposition.y * self.initframe.height+self.initframe.minY, width:width, height: height)
            
            // TODO: 背景色
            newtextview.backgroundColor = UIColor.clear
            
            newtextview.attributedText  = NSAttributedString(string: text.content as! String, attributes: attris as? [NSAttributedString.Key : Any])
            tempviews.append(newtextview)
                    }
                    //var j = 0
                    if(mysize>lastsize){
                        mysize = lastsize - 3
                    }
                    for xnow in tempviews{
                        //let xnow = x as! UITextView
                        var dictionary = xnow.attributedText.attributes(at: 0, effectiveRange: nil)
                        let mystring = xnow.attributedText.string
                        let font = dictionary[.font] as! UIFont
                        let fontname = font.fontName
                        let newfont = UIFont(name: fontname, size: mysize)
                        dictionary[.font] = newfont
                        xnow.attributedText = NSAttributedString(string: mystring, attributes: dictionary)
                        self.PageCellElments.append(xnow)
                        
                    }
        }
            }
        }
        return mysize
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

func addnewcontentandview(inthisframe myframe:CGRect,_ templatenow:FluidTemplate,data source:PageNode,tplid:Int)->UITextView{
        
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
    tempview.attributedText=createAttributedString(text: source.content as! String, type: source.type, font: templatenow.font, width:mywidth , height:myheight, color:color, fontmin:minfont, fontmax:maxfont,tplid:tplid)
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
    return FluidTemplate(backurl: "www.baidu.com", backcolor: "0x000000", fontcolor: "0xffffff", font: "TamilSangamMN", strong: "I",firstlayout: layoutway.layoutvertical, firstsecond: 0.300, firstsecondtype: composingtype.vertical, secondlayout: layoutway.layoutvertical, secondthird: 0.350, secondthirdtype: composingtype.vertical, thirdlayout: layoutway.layoutvertical, equallayout: true, myfontsize: fontsizemode.tosmallest, firstkuang: "100300800700", secondkuang:"100100800800",thirdkuang: "100100800800",zerofirstkuang: "100100800800",zerosecondkuang: "100100800800",zerothirdkuang:"100100800800",firstadmirefontmax: "100.0",firstadmirefontmin: "80.0", secondadmirefontmax: "80.0", secondadmirefontmin: "60.0", thirdadmirefontmax: "60.0", thirdadmirefontmin: "40.0")
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

func createAttributedString(text mytext:String,type contenttype:kind,font myfont:String,width mywidth:CGFloat,height myheight:CGFloat,color mycolor:UIColor,fontmin min:CGFloat,fontmax max:CGFloat,tplid:Int)->NSAttributedString {
   // LR : 这里看看待会儿要不要改吧
    let fontfamily = ["Helvetica","DIN Alternate","DIN Condensed","Hiragino Maru Gothic ProN","DIN Condensed","Bradley Hand","Helvetica","DIN Alternate","DIN Condensed","Hiragino Maru Gothic ProN","DIN Condensed","Bradley Hand"]
    let fontcolor = ["0xffffff","0xf0f0f0","0x646464","0x000000","50C5CE","0x646464","0x000000","0xf0f0f0","0x646464","0x000000","50C5CE","0x646464","0xf0f0f0","0x646464","0x000000"]

    var fontnow=max
    let ParagraphStyle=NSMutableParagraphStyle()
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
    
    var fonts : UIFont
    if (tplid < fontfamily.count) {
        fonts = UIFont(name: fontfamily[tplid], size: fontnow)!
    } else {
        fonts = UIFont.systemFont(ofSize: fontnow)
    }
    var mysizeheight:CGFloat = 0
    let mysizewidth:CGFloat = 0
   // let paddding = CGFloat(50)
    var padding = 0
    if(mytext.count < 100){
        padding = 30
    }else{
        if(mywidth>myheight){
            padding = 45
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
        if (tplid < fontfamily.count) {
            fonts = UIFont(name: fontfamily[tplid], size: fontnow)!
        } else {
            fonts = UIFont.systemFont(ofSize: fontnow)
        }
    }
//    if fontnow<min{
//        print("Too many words!")
//    }
    //print("fontnow\(fontnow)")
    //print("computingheight\(mysizeheight)")
    //print("originalsize\(myheight)")
    //print("fontnow\(fontnow)")
    var mycolor : UIColor
    if(tplid < fontcolor.count) {
        mycolor = fontcolor[tplid].hexcolor
    } else {
        mycolor = UIColor.black
    }
    
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


func getProperSize(originalPic picture:UIImage?,ProperOutline outline:CGRect)->(UIImage?,CGPoint){
    var res:UIImage?
    var point:CGPoint = CGPoint.zero
    if let pic = picture{
    let pi1 = (pic.size.height)/(pic.size.width)
    let pi2 = (outline.height)/(outline.width)

    if(pi1>pi2){
        let nowheight = outline.height
        let nowwidth = nowheight/pi1
        let rate = outline.height/pic.size.height
        let dx = (outline.width-nowwidth)/2
        point = CGPoint(x: outline.minX+dx, y: outline.minY)
        res = pic.scaleImage(scaleSize: rate)
    }
    else{
        let nowwidth = outline.width
        let nowheight = nowwidth*pi1
        let rate = outline.width/pic.size.width
        let dy = (outline.height-nowheight)/2
        point = CGPoint(x: outline.minX, y: outline.minY+dy)
        res = pic.scaleImage(scaleSize: rate)
    }
    print("~~~~~~~~~Now the Res is\(res as Any)~~~~~~~~~~~~~~~~~")
    }
    return (res,point)
}


func modifyTotheSameSize(mypage thispage:PageView){
    var firstsize:CGFloat = 10000
    var secondsize:CGFloat = 10000
    var thirdsize:CGFloat = 10000
    for x in thispage.PageCellElments{
        if(x.tag == 10000){
            let xnow = x as! UITextView
            let dictionary = xnow.attributedText.attributes(at: 0, effectiveRange: nil)
            let font = dictionary[.font] as! UIFont
            if(font.pointSize<firstsize){
                firstsize = font.pointSize
            }
        }
        if(x.tag == 20000){
            let xnow = x as! UITextView
            let dictionary = xnow.attributedText.attributes(at: 0, effectiveRange: nil)
            let font = dictionary[.font] as! UIFont
            if(font.pointSize<secondsize){
                secondsize = font.pointSize
            }
        }
        if(x.tag == 30000){
            let xnow = x as! UITextView
            let dictionary = xnow.attributedText.attributes(at: 0, effectiveRange: nil)
            let font = dictionary[.font] as! UIFont
            if(font.pointSize<thirdsize){
                thirdsize = font.pointSize
            }
        }
    }
    if(secondsize>firstsize){
        secondsize = firstsize-3
    }
    if(thirdsize>secondsize){
        thirdsize = secondsize-3
    }
    
    var i = 0
    for x in thispage.PageCellElments{
        if(x.tag == 10000){
            let xnow = x as! UITextView
            var dictionary = xnow.attributedText.attributes(at: 0, effectiveRange: nil)
            let mystring = xnow.attributedText.string
            let font = dictionary[.font] as! UIFont
            let fontname = font.fontName
            let newfont = UIFont(name: fontname, size: firstsize)
            dictionary[.font] = newfont
            xnow.attributedText = NSAttributedString(string: mystring, attributes: dictionary)
            thispage.PageCellElments[i] = xnow
        }
        if(x.tag == 20000){
            let xnow = x as! UITextView
            var dictionary = xnow.attributedText.attributes(at: 0, effectiveRange: nil)
            let mystring = xnow.attributedText.string
            let font = dictionary[.font] as! UIFont
            let fontname = font.fontName
            let newfont = UIFont(name: fontname, size: secondsize)
            dictionary[.font] = newfont
            xnow.attributedText = NSAttributedString(string: mystring, attributes: dictionary)
            thispage.PageCellElments[i] = xnow
        }
        if(x.tag == 30000){
            let xnow = x as! UITextView
            var dictionary = xnow.attributedText.attributes(at: 0, effectiveRange: nil)
            let mystring = xnow.attributedText.string
            let font = dictionary[.font] as! UIFont
            let fontname = font.fontName
            let newfont = UIFont(name: fontname, size: thirdsize)
            dictionary[.font] = newfont
            xnow.attributedText = NSAttributedString(string: mystring, attributes: dictionary)
            thispage.PageCellElments[i] = xnow
        }
        i=i+1
    }
}

func createAttributedStringandSize(text mytext:String,type contenttype:kind,font myfont:String,width mywidth:CGFloat,height myheight:CGFloat,color mycolor:UIColor,fontmin min:CGFloat,fontmax max:CGFloat)->(NSDictionary?,CGFloat){
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
    
    var fonts=UIFont(name: myfont, size: fontnow) ?? UIFont(name: "Copperplate", size: fontnow)
    var mysizeheight:CGFloat = 0
    let mysizewidth:CGFloat = 0
    // let paddding = CGFloat(50)
    var padding = 0
    if(mytext.count < 100){
        padding = 30
    }else{
        if(mywidth>myheight){
            padding = 30
        }else if (mywidth>myheight/2){
            padding = 50
        }else{
            padding = 60
        }
    }
    let wantheight = myheight - CGFloat(padding)
    print("*******Width*********\(mywidth)")
    print("*******Height*********\(wantheight)")
    
    while true{
        mysizeheight=getTextHeight(textStr: mytext, font: fonts!, width: mywidth, linespace: linespace, wordspace:wordspace )
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
        fonts=UIFont(name: myfont, size: fontnow) ?? UIFont(name: "Copperplate", size: fontnow)
    }
    //    if fontnow<min{
    //        print("Too many words!")
    //    }
    //print("fontnow\(fontnow)")
    //print("computingheight\(mysizeheight)")
    //print("originalsize\(myheight)")
    //print("fontnow\(fontnow)")
    return([NSAttributedString.Key.font:fonts,NSAttributedString.Key.foregroundColor:mycolor,NSAttributedString.Key.paragraphStyle:ParagraphStyle],fontnow) //这里再修改一点点
}

