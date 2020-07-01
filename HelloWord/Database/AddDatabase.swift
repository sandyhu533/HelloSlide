//
//  AddDatabase.swift
//  HelloWord
//
//  Copyright © 2019 HelloWord. All rights reserved.
//

import Foundation
import UIKit

let DEBUG = true

func loadData(){
    
    if(!ifExists(instanceid: 001001) && !DEBUG){
        
       // MARK: - 001
       
       let i001001 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i001001", ofType: "png")!)
       let i001002 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i001002", ofType: "png")!)
       let i001003 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i001003", ofType: "png")!)
       let i001004 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i001004", ofType: "png")!)
       let i001005 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i001005", ofType: "png")!)
       let i001006 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i001006", ofType: "png")!)
       let i001007 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i001007", ofType: "png")!)
       let i001008 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i001008", ofType: "png")!)
       let i001009 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i001009", ofType: "png")!)
       let i001010 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i001010", ofType: "png")!)
       let i001011 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i001011", ofType: "png")!)
    

    addComposingToDatabase(1000, composingid: 001001, bgpic: i001001!, firstposition: "291333437347", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1000, composingid: 001006, bgpic: i001010!, firstposition: "218152562104", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1000, composingid: 001011, bgpic: i001005!, firstposition: "151270593388", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1100, composingid: 001016, bgpic: i001002!, firstposition: "072347218347", secondposition: "447291489458", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1100, composingid: 001021, bgpic: i001001!, firstposition: "302250395104", secondposition: "250423500291", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0xffffff0x9b9b9b")

    addComposingToDatabase(1200, composingid: 001026, bgpic: i001002!, firstposition: "072347218347", secondposition: "427208510236427513510236", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1200, composingid: 001031, bgpic: i001007!, firstposition: "411250244513", secondposition: "687250244513098354177298", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1300, composingid: 001036, bgpic: i001002!, firstposition: "072347218347", secondposition: "416097531208416375531208416652531208", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1300, composingid: 001041, bgpic: i001011!, firstposition: "687305250388", secondposition: "067097484236067375484236067652484236", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1400, composingid: 001046, bgpic: i001005!, firstposition: "281145348131", secondposition: "145319281201489319281208145562281201489562281201", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0xffffff0x9b9b9b")

    addComposingToDatabase(1400, composingid: 001051, bgpic: i001008!, firstposition: "088347192347", secondposition: "442090234354713090239354442493234354713493239354", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1120, composingid: 001056, bgpic: i001002!, firstposition: "072347218347", secondposition: "416125510236", thirdposition: "427458218347708458218347", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1120, composingid: 001061, bgpic: i001003!, firstposition: "437125317097", secondposition: "239250515083", thirdposition: "182381260368494381260368", imageposition: "", font:"DIN Alternate",color:"0xffffff0xffffff0xc8c8c8")

    addComposingToDatabase(1220, composingid: 001066, bgpic: i001006!, firstposition: "078361208291", secondposition: "421208229145692208223145", thirdposition: "421423223340692423223340", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1220, composingid: 001071, bgpic: i001005!, firstposition: "250138406125", secondposition: "109312312104479312317104", thirdposition: "109458312291479458317291", imageposition: "", font:"DIN Alternate",color:"0xffffff0xffffff0xc8c8c8")

    addComposingToDatabase(1240, composingid: 001076, bgpic: i001008!, firstposition: "083361203298", secondposition: "401173255069682173255069", thirdposition: "401291255250682291255243083361203298401576255243", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1240, composingid: 001081, bgpic: i001002!, firstposition: "078326213354", secondposition: "421041125430421520125430", thirdposition: "578041348187578284348187578520348187578756348187", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1440, composingid: 001086, bgpic: i001008!, firstposition: "078361208270", secondposition: "432055223069692055223069432513223069692513223069", thirdposition: "432159223270692159223270432618223270692618223270", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1440, composingid: 001091, bgpic: i001003!, firstposition: "250118395111", secondposition: "151277276048468277276048151562276048468562276048", thirdposition: "151361276159468361276159151645276159468645276159", imageposition: "", font:"DIN Alternate",color:"0xffffff0xffffff0xc8c8c8")

    addComposingToDatabase(1001, composingid: 001096, bgpic: i001011!, firstposition: "708319203333", secondposition: "", thirdposition: "", imageposition: "072208479555", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1001, composingid: 001101, bgpic: i001003!, firstposition: "218645557145", secondposition: "", thirdposition: "", imageposition: "265166463437", font:"DIN Alternate",color:"0xffffff0xffffff0xc8c8c8")

    addComposingToDatabase(1002, composingid: 001106, bgpic: i001007!, firstposition: "067340234298", secondposition: "", thirdposition: "", imageposition: "479048385409479500385409", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1002, composingid: 001111, bgpic: i001002!, firstposition: "072340223305", secondposition: "", thirdposition: "", imageposition: "390312270361687312270361", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1101, composingid: 001116, bgpic: i001006!, firstposition: "083375203243", secondposition: "432645484118", thirdposition: "", imageposition: "468222411381", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1101, composingid: 001121, bgpic: i001005!, firstposition: "218590437097", secondposition: "156722557083", thirdposition: "", imageposition: "218194437340", font:"DIN Alternate",color:"0xffffff0xffffff0xc8c8c8")

    addComposingToDatabase(1202, composingid: 001126, bgpic: i001008!, firstposition: "088347192347", secondposition: "442090234354713493239354", thirdposition: "", imageposition: "713090239354437500239347", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1202, composingid: 001131, bgpic: i001011!, firstposition: "708340203270", secondposition: "036576255215322576260215", thirdposition: "", imageposition: "036236255291322236260291", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(2000, composingid: 001136, bgpic: i001003!, firstposition: "104305328361463305328361", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(2000, composingid: 001141, bgpic: i001005!, firstposition: "427138328340145513328340", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(2200, composingid: 001146, bgpic: i001009!, firstposition: "041111114333041513114333", secondposition: "182111265333182513265333", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0x9b9b9b0x9b9b9b0x9b9b9b")

    addComposingToDatabase(2200, composingid: 001151, bgpic: i001009!, firstposition: "515152296090140298296090", secondposition: "515298296305140437296298", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(2202, composingid: 001156, bgpic: i001005!, firstposition: "484131302069130277307076", secondposition: "484569302145130715307145", thirdposition: "", imageposition: "484256302250130402307256", font:"DIN Alternate",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(2202, composingid: 001161, bgpic: i001006!, firstposition: "083305208138083548208138", secondposition: "427104161368427527161361", thirdposition: "", imageposition: "630104307368630527307361", font:"DIN Alternate",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(3000, composingid: 001166, bgpic: i001009!, firstposition: "046069390229046375390222046666390229", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0x9b9b9b0x9b9b9b0x9b9b9b")

    addComposingToDatabase(3000, composingid: 001171, bgpic: i001003!, firstposition: "385125411201260381416201125625411208", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(4000, composingid: 001176, bgpic: i001003!, firstposition: "171159296291489159296291098527296284416527296284", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(4000, composingid: 001181, bgpic: i001005!, firstposition: "135208140548307208140548479208140548651208140548", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Alternate",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(4004, composingid: 001186, bgpic: i001003!, firstposition: "177437239076177805239076510368239076510736239076", secondposition: "", thirdposition: "", imageposition: "177180239222177548239222510118239215510486239215", font:"DIN Alternate",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(0001, composingid: 001191, bgpic: i001004!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "270298411388", font:"DIN Alternate",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(0001, composingid: 001196, bgpic: i001001!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "270298411388", font:"DIN Alternate",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(0002, composingid: 001201, bgpic: i001003!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "104305328361463305328361", font:"DIN Alternate",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(0002, composingid: 001206, bgpic: i001005!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "427138328340145513328340", font:"DIN Alternate",color:"0xffffff0xffffff0xffffff")

       // MARK: - 002
       
       let i002001 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i002001", ofType: "png")!)
       let i002002 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i002002", ofType: "png")!)
       let i002003 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i002003", ofType: "png")!)
       let i002004 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i002004", ofType: "png")!)
       let i002005 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i002005", ofType: "png")!)
       let i002006 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i002006", ofType: "png")!)
       let i002007 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i002007", ofType: "png")!)
       let i002008 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i002008", ofType: "png")!)
       let i002009 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i002009", ofType: "png")!)
       let i002010 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i002010", ofType: "png")!)
       let i002011 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i002011", ofType: "png")!)
       let i002012 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i002011", ofType: "png")!)
       
    addComposingToDatabase(1000, composingid: 002001, bgpic: i002001!, firstposition: "175654666187", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1100, composingid: 002006, bgpic: i002002!, firstposition: "372203259127", secondposition: "372406259406", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(1100, composingid: 002011, bgpic: i002003!, firstposition: "079112367135", secondposition: "548172389661", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1200, composingid: 002016, bgpic: i002005!, firstposition: "242052531112", secondposition: "180375276503649375276503", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1220, composingid: 002021, bgpic: i002003!, firstposition: "067082322187", secondposition: "508105209142751105209142", thirdposition: "508293209571751293209571", imageposition: "", font:"DIN Condensed",color:"0x3131310x54A6D10x313131")

    addComposingToDatabase(1300, composingid: 002026, bgpic: i002006!, firstposition: "045586197338", secondposition: "259067740255395368604255531669468255", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0xffffff0x3131310x313131")

    addComposingToDatabase(1400, composingid: 002031, bgpic: i002004!, firstposition: "299045429120", secondposition: "163323293203621323293203163601293210621601293210", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0x54A6D10x3131310x313131")

    addComposingToDatabase(1120, composingid: 002036, bgpic: i002002!, firstposition: "372203259127", secondposition: "372406259406", thirdposition: "039406259406706406259406", imageposition: "", font:"DIN Condensed",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(1240, composingid: 002041, bgpic: i002007!, firstposition: "288037412127", secondposition: "310233276127412759282127", thirdposition: "073398282142073661282187666263276187666578276150", imageposition: "", font:"DIN Condensed",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(1440, composingid: 002046, bgpic: i002008!, firstposition: "316045401127", secondposition: "096248186075305248192075514248192075723248192075", thirdposition: "096631186285305631186285514631192285723631192285", imageposition: "", font:"DIN Condensed",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1001, composingid: 002051, bgpic: i002009!, firstposition: "084172248593", secondposition: "", thirdposition: "", imageposition: "435225451488", font:"DIN Condensed",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(1002, composingid: 002056, bgpic: i002010!, firstposition: "378150237654", secondposition: "", thirdposition: "", imageposition: "033248310451649248310451", font:"DIN Condensed",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1101, composingid: 002061, bgpic: i002011!, firstposition: "101082350142", secondposition: "536157395578", thirdposition: "", imageposition: "101330350451", font:"DIN Condensed",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1202, composingid: 002066, bgpic: i002007!, firstposition: "288037423127", secondposition: "022669259090677345259090", thirdposition: "", imageposition: "022248259308677593254300", font:"DIN Condensed",color:"0x3131310x3131310x313131")

    addComposingToDatabase(2000, composingid: 002071, bgpic: i002009!, firstposition: "045195418533536195412533", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(0002, composingid: 002076, bgpic: i002009!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "045195418533536195412533", font:"DIN Condensed",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(0001, composingid: 002081, bgpic: i002009!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "231180548586", font:"DIN Condensed",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(2200, composingid: 002086, bgpic: i002012!, firstposition: "050150288240158601282233", secondposition: "401082598390502518497398", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0xffffff0x3131310x313131")

    addComposingToDatabase(2202, composingid: 002091, bgpic: i002005!, firstposition: "079045350120525045350120", secondposition: "169248254210615248254210", thirdposition: "", imageposition: "079518338398531518338398", font:"DIN Condensed",color:"0x3131310x3131310x313131")

    addComposingToDatabase(0003, composingid: 002096, bgpic: i002010!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "022218299466350218305466683218299466", font:"DIN Condensed",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(0004, composingid: 002101, bgpic: i002010!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "135037299360135443299353570195299353570593299360", font:"DIN Condensed",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(4004, composingid: 002106, bgpic: i002002!, firstposition: "355165293127355338293127355518293127355691293127", secondposition: "", thirdposition: "", imageposition: "045097259338045556259330700097259338700556259338", font:"DIN Condensed",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(3000, composingid: 002111, bgpic: i002006!, firstposition: "259067740255395368604255531669468255", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0x3131310x3131310x313131")

    addComposingToDatabase(4000, composingid: 002116, bgpic: i002004!, firstposition: "163323293203621323293203163601293210621601293210", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0x54A6D10x3131310x313131")


       // MARK: - 003
           let i003001 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003001", ofType: "png")!)
           let i003002 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003002", ofType: "png")!)
           let i003003 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003003", ofType: "png")!)
           let i003004 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003004", ofType: "png")!)
           let i003005 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003005", ofType: "png")!)
           let i003006 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003006", ofType: "png")!)
           let i003007 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003007", ofType: "png")!)
           let i003008 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003008", ofType: "png")!)

           let i103001 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i103001", ofType: "png")!)
           let i103002 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i103002", ofType: "png")!)
           let i103003 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i103003", ofType: "png")!)
           let i103004 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i103004", ofType: "png")!)
           let i103005 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i103005", ofType: "png")!)
           let i103006 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i103006", ofType: "png")!)
           let i103007 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i103007", ofType: "png")!)

       //    let i003009 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003009", ofType: "png")!)
           

    addComposingToDatabase(1000, composingid: 003001, bgpic: i003001!, firstposition: "180703652203", secondposition: "", thirdposition: "", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x4444430x4444430x444443")
    
    
    addComposingToDatabase(1100, composingid: 003006, bgpic:  i003001!, firstposition: "180703652203", secondposition: "182906700090", thirdposition: "", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x0000000x4444430x000000")
    
    
    addComposingToDatabase(2000, composingid: 003011, bgpic: i003002!, firstposition: "361074513314361462513333", secondposition: "", thirdposition: "", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x4444430x4444430x444443")
    
    
    addComposingToDatabase(1300, composingid: 003016, bgpic: i003003!, firstposition: "166018736148", secondposition: "041629277240375629277240694629263240",thirdposition: "", imageposition: "",font:"Hiragino Maru Gothic ProN",color:"0x4444430x4444430x444443")
    
    
    addComposingToDatabase(1120, composingid: 003021, bgpic: i003004!, firstposition: "097018791111", secondposition: "069296750129", thirdposition: "041759416148527759430148", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x0000000x4444430x444443")
    
    
    addComposingToDatabase(1220, composingid: 003026, bgpic: i003005!, firstposition: "069037875092", secondposition: "041555416185527555444185", thirdposition: "041796375129527796416129", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x0000000x4444430x444443")
    
    
    addComposingToDatabase(1440, composingid: 003031, bgpic: i003006!, firstposition: "125037694129", secondposition: "027277416074541277430074041666402092555648416092", thirdposition: "027425416129541425444129027833430129555833430129", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x0000000x4444430x444443")
    
    
    addComposingToDatabase(1101, composingid: 003036, bgpic: i003007!, firstposition: "250037680148", secondposition: "236277680111", thirdposition: "", imageposition: "250481680407", font:"Hiragino Maru Gothic ProN",color:"0x0000000x4444430x444443")
    
    
    addComposingToDatabase(0002, composingid: 003041, bgpic: i003008!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "555129375722055148333703", font:"Hiragino Maru Gothic ProN",color:"0x0000000x0000000x313131")
    
    
    addComposingToDatabase(0004, composingid: 003046, bgpic: i003008!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "013111319370666092319370013574319333652555333351", font:"Hiragino Maru Gothic ProN",color:"0x3131310x3131310x313131")
    
    
    addComposingToDatabase(1100, composingid: 003051, bgpic: i003006!, firstposition: "236259583185", secondposition: "097537833203", thirdposition: "", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x0000000x4444430x444443")
    
    addComposingToDatabase(1200, composingid: 003056, bgpic: i003003!, firstposition: "020055139268", secondposition: "363111496259363509496259", thirdposition: "", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x4444430x4444430x444443")
    
    // 第二种颜色
    addComposingToDatabase(1000, composingid: 003002, bgpic: i103001!, firstposition: "180703652203", secondposition: "", thirdposition: "", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x4444430x4444430x444443")
    
    
    addComposingToDatabase(1100, composingid: 003007, bgpic:  i103001!, firstposition: "180703652203", secondposition: "182906700090", thirdposition: "", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x0000000x4444430x000000")
    
    
    addComposingToDatabase(2000, composingid: 003012, bgpic: i103002!, firstposition: "361074513314361462513333", secondposition: "", thirdposition: "", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x4444430x4444430x444443")
    
    
    addComposingToDatabase(1300, composingid: 003017, bgpic: i103003!, firstposition: "166018736148", secondposition: "041629277240375629277240694629263240",thirdposition: "", imageposition: "",font:"Hiragino Maru Gothic ProN",color:"0x4444430x4444430x444443")
    
    
    addComposingToDatabase(1120, composingid: 003022, bgpic: i103004!, firstposition: "097018791111", secondposition: "069296750129", thirdposition: "041759416148527759430148", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x0000000x4444430x444443")
    
    
    addComposingToDatabase(1220, composingid: 003027, bgpic: i103005!, firstposition: "069037875092", secondposition: "041555416185527555444185", thirdposition: "041796375129527796416129", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x0000000x4444430x444443")
    
    
    addComposingToDatabase(1440, composingid: 003032, bgpic: i103006!, firstposition: "125037694129", secondposition: "027277416074541277430074041666402092555648416092", thirdposition: "027425416129541425444129027833430129555833430129", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x0000000x4444430x444443")
    
    
    addComposingToDatabase(1101, composingid: 003037, bgpic: i103007!, firstposition: "250037680148", secondposition: "236277680111", thirdposition: "", imageposition: "250481680407", font:"Hiragino Maru Gothic ProN",color:"0x0000000x4444430x444443")
    
    
    addComposingToDatabase(0002, composingid: 003042, bgpic: i003008!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "555129375722055148333703", font:"Hiragino Maru Gothic ProN",color:"0x0000000x0000000x313131")
    
    
    addComposingToDatabase(0004, composingid: 003047, bgpic: i003008!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "013111319370666092319370013574319333652555333351", font:"Hiragino Maru Gothic ProN",color:"0x3131310x3131310x313131")
    
    
    addComposingToDatabase(1100, composingid: 003052, bgpic: i103006!, firstposition: "236259583185", secondposition: "097537833203", thirdposition: "", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x0000000x4444430x444443")
    
    addComposingToDatabase(1200, composingid: 003052, bgpic: i103003!, firstposition: "020055139268", secondposition: "363111496259363509496259", thirdposition: "", imageposition: "", font:"Hiragino Maru Gothic ProN",color:"0x4444430x4444430x444443")
       // MARK: - 004
       
       let i004001 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i004001", ofType: "png")!)
   //    let i004002 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i004002", ofType: "png")!)
       let i004003 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i004003", ofType: "png")!)
       let i004004 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i004004", ofType: "png")!)
       let i004005 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i004005", ofType: "png")!)
       let i004006 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i004006", ofType: "png")!)
       
       addComposingToDatabase(1100, composingid: 004001, bgpic: i004001!, firstposition: "373381597229", secondposition: "224679775152", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0x3131310x3131310x313131")

       addComposingToDatabase(1000, composingid: 004006, bgpic: i004001!, firstposition: "258664488190", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0x3131310x3131310x313131")

       addComposingToDatabase(1200, composingid: 004011, bgpic: i004003!, firstposition: "402330195369", secondposition: "109253252530637253252530", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0x3131310xffffff0xffffff")

       addComposingToDatabase(1300, composingid: 004016, bgpic: i004004!, firstposition: "321106350137", secondposition: "120351224450385351224450649351229450", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0xffffff0xffffff0xffffff")

       addComposingToDatabase(1120, composingid: 004021, bgpic: i004003!, firstposition: "402146201207", secondposition: "413415178346", thirdposition: "103276264507632276270507", imageposition: "", font:"DIN Condensed",color:"0x3131310x3131310x313131")

       addComposingToDatabase(1120, composingid: 004026, bgpic: i004005!, firstposition: "281671436160", secondposition: "086076327145597076327145", thirdposition: "086267327328597267327328", imageposition: "", font:"DIN Condensed",color:"0xffffff0x3131310x313131")

       addComposingToDatabase(1440, composingid: 004031, bgpic: i004006!, firstposition: "344061425107", secondposition: "218300310053586292310053218638310053586638310053", thirdposition: "218376310169586376310169218723310169586715310176", imageposition: "", font:"DIN Condensed",color:"0x3131310x50C5CE0x313131")

       addComposingToDatabase(1101, composingid: 004036, bgpic: i004004!, firstposition: "103114408106", secondposition: "103259758061", thirdposition: "", imageposition: "206396563465", font:"DIN Condensed",color:"0xffffff0xffffff0xffffff")

       addComposingToDatabase(0002, composingid: 004041, bgpic: i004003!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "091276293438626276287438", font:"DIN Condensed",color:"0xffffff0xffffff0xffffff")

       addComposingToDatabase(0004, composingid: 004046, bgpic: i004004!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "097129362320540129362320097557362320540557362320", font:"DIN Condensed",color:"0xffffff0xffffff0xffffff")

       addComposingToDatabase(2000, composingid: 004051, bgpic: i004003!, firstposition: "091276293438626276287438", secondposition: "", thirdposition: "", imageposition: "", font:"DIN Condensed",color:"0xffffff0xffffff0xffffff")


    // MARK: - 005
    
    let i005001 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005001", ofType: "png")!)
    let i005002 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005002", ofType: "png")!)
    let i005003 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005003", ofType: "png")!)
    let i005004 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005004", ofType: "png")!)
    let i005005 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005005", ofType: "png")!)
    let i005006 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005006", ofType: "png")!)
    let i005007 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005007", ofType: "png")!)
    let i005008 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005008", ofType: "png")!)
    let i005009 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005009", ofType: "png")!)
    let i005010 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005010", ofType: "png")!)
    let i005011 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005011", ofType: "png")!)
    let i005012 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005012", ofType: "png")!)

    let i005101 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005101", ofType: "png")!)
    let i005102 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005102", ofType: "png")!)
    let i005103 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005103", ofType: "png")!)
    let i005104 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005104", ofType: "png")!)
    let i005105 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005105", ofType: "png")!)
    let i005106 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005106", ofType: "png")!)
    let i005107 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005107", ofType: "png")!)
    let i005108 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005108", ofType: "png")!)
    let i005109 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005109", ofType: "png")!)
    let i005110 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005110", ofType: "png")!)
    let i005111 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005111", ofType: "png")!)
    let i005112 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005112", ofType: "png")!)
    
    let i005201 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005201", ofType: "png")!)
    let i005202 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005202", ofType: "png")!)
    let i005203 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005203", ofType: "png")!)
    let i005204 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005204", ofType: "png")!)
    let i005205 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005205", ofType: "png")!)
    let i005206 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005206", ofType: "png")!)
    let i005207 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005207", ofType: "png")!)
    let i005208 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005208", ofType: "png")!)
    let i005209 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005209", ofType: "png")!)
    let i005210 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005210", ofType: "png")!)
    let i005211 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005211", ofType: "png")!)
    let i005212 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i005212", ofType: "png")!)
    
    addComposingToDatabase(1000, composingid: 005001, bgpic: i005001!, firstposition: "235586516225", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6a000c0x6a000c0x6a000c")

    addComposingToDatabase(1100, composingid: 005006, bgpic: i005001!, firstposition: "264541460187", secondposition: "129774752127", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6a000c0x6464640x6a000c")

    addComposingToDatabase(1000, composingid: 005011, bgpic: i005004!, firstposition: "286375426263", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6a000c0x6a000c0x6a000c")

    addComposingToDatabase(1100, composingid: 005016, bgpic: i005004!, firstposition: "314375337142", secondposition: "275548415090", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6a000c0x6464640x6a000c")

    addComposingToDatabase(1200, composingid: 005021, bgpic: i005009!, firstposition: "387164224074", secondposition: "134365308350584365314350", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6a000c0x6464640x6a000c")

    addComposingToDatabase(1002, composingid: 005026, bgpic: i005009!, firstposition: "387164224074", secondposition: "", thirdposition: "", imageposition: "134365308350584365314350", font:"Bradley Hand",color:"0x6a000c0x6464640x6a000c")

    addComposingToDatabase(1300, composingid: 005031, bgpic: i005005!, firstposition: "387172207075", secondposition: "213278595127213451595127213631595127", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6a000c0x6464640x6a000c")

    addComposingToDatabase(1400, composingid: 005036, bgpic: i005007!, firstposition: "393165207082", secondposition: "202338264195623330258203202593264203623593258203", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6a000c0x6464640x6a000c")

    addComposingToDatabase(1120, composingid: 005041, bgpic: i005002!, firstposition: "533216292074", secondposition: "162380134186", thirdposition: "421365488149421582488149", imageposition: "", font:"Bradley Hand",color:"0x6a000c0x6464640x646464")

    addComposingToDatabase(1220, composingid: 005046, bgpic: i005006!, firstposition: "150164700120", secondposition: "623343275156623604275156", thirdposition: "129298382231129574382231", imageposition: "", font:"Bradley Hand",color:"0x6a000c0x6464640x646464")

    addComposingToDatabase(1202, composingid: 005051, bgpic: i005006!, firstposition: "398164196082", secondposition: "129298348223129574348223", thirdposition: "", imageposition: "668268202231668552202231", font:"Bradley Hand",color:"0x6a000c0x6464640x646464")

    addComposingToDatabase(1240, composingid: 005056, bgpic: i005011!, firstposition: "398164207082", secondposition: "095343314104561611314104", thirdposition: "089500258119089649264111724328219082724440219082", imageposition: "", font:"Bradley Hand",color:"0x6a000c0x6464640x646464")

    addComposingToDatabase(1440, composingid: 005061, bgpic: i005007!, firstposition: "393165202082", secondposition: "207293207060617293213060207571207060617571213060", thirdposition: "207383280120617383280120207661280120617661280120", imageposition: "", font:"Bradley Hand",color:"0x6a000c0x6a000c0x646464")

    addComposingToDatabase(1001, composingid: 005066, bgpic: i005012!, firstposition: "120320339374", secondposition: "", thirdposition: "", imageposition: "574320333374", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(1101, composingid: 005071, bgpic: i005009!, firstposition: "387164224074", secondposition: "134365308350", thirdposition: "", imageposition: "584365314350", font:"Bradley Hand",color:"0x6a000c0x6464640x6a000c")

    addComposingToDatabase(2000, composingid: 005076, bgpic: i005012!, firstposition: "120320339374574320333374", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(0002, composingid: 005081, bgpic: i005012!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "120320339374574320333374", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(2200, composingid: 005086, bgpic: i005008!, firstposition: "084308185112719308185112", secondposition: "084496179278719496185278", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6a000c0x6464640x646464")

    addComposingToDatabase(2202, composingid: 005091, bgpic: i005008!, firstposition: "073203191067730203191067", secondposition: "073308191157730308191157", thirdposition: "", imageposition: "073526191240730518191240", font:"Bradley Hand",color:"0x6a000c0x6464640x646464")

    addComposingToDatabase(3000, composingid: 005096, bgpic: i005005!, firstposition: "235225595172235436601165235631595172", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(4004, composingid: 005101, bgpic: i005003!, firstposition: "196210275052640210275045202488275045640481275052", secondposition: "", thirdposition: "", imageposition: "168293320165612285320165174563320165612563320165", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(0004, composingid: 005106, bgpic: i005010!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "050335213261280335213261516335213261747335213261", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(4000, composingid: 005111, bgpic: i005010!, firstposition: "050335213261280335213261516335213261747335213261", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(0003, composingid: 005116, bgpic: i005010!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "067320269328370320275328674320275328", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(0001, composingid: 005121, bgpic: i005010!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "235276539440", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    // 配色2
    
    addComposingToDatabase(1000, composingid: 005002, bgpic: i005101!, firstposition: "235586516225", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x3452990x3452990x345299")

    addComposingToDatabase(1100, composingid: 005007, bgpic: i005101!, firstposition: "264541460187", secondposition: "129774752127", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x3452990x6464640x345299")

    addComposingToDatabase(1000, composingid: 005012, bgpic: i005104!, firstposition: "286375426263", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x3452990x3452990x345299")

    addComposingToDatabase(1100, composingid: 005017, bgpic: i005104!, firstposition: "314375337142", secondposition: "275548415090", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x3452990x6464640x345299")

    addComposingToDatabase(1200, composingid: 005022, bgpic: i005109!, firstposition: "150164700120", secondposition: "134365308350584365314350", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x3452990x6464640x345299")

    addComposingToDatabase(1002, composingid: 005027, bgpic: i005109!, firstposition: "150164700120", secondposition: "", thirdposition: "", imageposition: "134365308350584365314350", font:"Bradley Hand",color:"0x3452990x6464640x345299")

    addComposingToDatabase(1300, composingid: 005032, bgpic: i005105!, firstposition: "150164700120", secondposition: "213278595127213451595127213631595127", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x3452990x6464640x345299")

    addComposingToDatabase(1400, composingid: 005037, bgpic: i005107!, firstposition: "150164700120", secondposition: "202338264195623330258203202593264203623593258203", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x3452990x6464640x345299")

    addComposingToDatabase(1120, composingid: 005042, bgpic: i005102!, firstposition: "533216292074", secondposition: "162380134186", thirdposition: "421365488149421582488149", imageposition: "", font:"Bradley Hand",color:"0x3452990x6464640x646464")

    addComposingToDatabase(1220, composingid: 005047, bgpic: i005106!, firstposition: "150164700120", secondposition: "623343275156623604275156", thirdposition: "129298382231129574382231", imageposition: "", font:"Bradley Hand",color:"0x3452990x6464640x646464")

    addComposingToDatabase(1202, composingid: 005052, bgpic: i005106!, firstposition: "398164196082", secondposition: "129298348223129574348223", thirdposition: "", imageposition: "668268202231668552202231", font:"Bradley Hand",color:"0x3452990x6464640x646464")

    addComposingToDatabase(1240, composingid: 005057, bgpic: i005111!, firstposition: "150164700120", secondposition: "095343314104561611314104", thirdposition: "089500258119089649264111724328219082724440219082", imageposition: "", font:"Bradley Hand",color:"0x3452990x6464640x646464")

    addComposingToDatabase(1440, composingid: 005062, bgpic: i005107!, firstposition: "150164700120", secondposition: "207293207060617293213060207571207060617571213060", thirdposition: "207383280120617383280120207661280120617661280120", imageposition: "", font:"Bradley Hand",color:"0x3452990x3452990x646464")

    addComposingToDatabase(1001, composingid: 005067, bgpic: i005112!, firstposition: "150164700120", secondposition: "", thirdposition: "", imageposition: "574320333374", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(1101, composingid: 005072, bgpic: i005109!, firstposition: "150164700120", secondposition: "134365308350", thirdposition: "", imageposition: "584365314350", font:"Bradley Hand",color:"0x3452990x6464640x345299")

    addComposingToDatabase(2000, composingid: 005077, bgpic: i005112!, firstposition: "120320339374574320333374", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(0002, composingid: 005082, bgpic: i005112!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "120320339374574320333374", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(2200, composingid: 005087, bgpic: i005108!, firstposition: "084308185112719308185112", secondposition: "084496179278719496185278", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x3452990x6464640x646464")

    addComposingToDatabase(2202, composingid: 005092, bgpic: i005108!, firstposition: "073203191067730203191067", secondposition: "073308191157730308191157", thirdposition: "", imageposition: "073526191240730518191240", font:"Bradley Hand",color:"0x3452990x6464640x646464")

    addComposingToDatabase(3000, composingid: 005097, bgpic: i005105!, firstposition: "235225595172235436601165235631595172", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(4004, composingid: 005102, bgpic: i005103!, firstposition: "196210275052640210275045202488275045640481275052", secondposition: "", thirdposition: "", imageposition: "168293320165612285320165174563320165612563320165", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(0004, composingid: 005107, bgpic: i005110!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "050335213261280335213261516335213261747335213261", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(4000, composingid: 005112, bgpic: i005110!, firstposition: "050335213261280335213261516335213261747335213261", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(0003, composingid: 005117, bgpic: i005110!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "067320269328370320275328674320275328", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(0001, composingid: 005122, bgpic: i005110!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "235276539440", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    // 配色3
    
        addComposingToDatabase(1000, composingid: 005003, bgpic: i005201!, firstposition: "235586516225", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0xCF96210xCF96210xCF9621")

    addComposingToDatabase(1100, composingid: 005008, bgpic: i005201!, firstposition: "264541460187", secondposition: "129774752127", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0xCF96210x6464640xCF9621")

    addComposingToDatabase(1000, composingid: 005013, bgpic: i005204!, firstposition: "286375426263", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0xCF96210xCF96210xCF9621")

    addComposingToDatabase(1100, composingid: 005018, bgpic: i005204!, firstposition: "314375337142", secondposition: "275548415090", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0xCF96210x6464640xCF9621")

    addComposingToDatabase(1200, composingid: 005023, bgpic: i005209!, firstposition: "387164224074", secondposition: "134365308350584365314350", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0xCF96210x6464640xCF9621")

    addComposingToDatabase(1002, composingid: 005028, bgpic: i005209!, firstposition: "387164224074", secondposition: "", thirdposition: "", imageposition: "134365308350584365314350", font:"Bradley Hand",color:"0xCF96210x6464640xCF9621")

    addComposingToDatabase(1300, composingid: 005033, bgpic: i005205!, firstposition: "387172207075", secondposition: "213278595127213451595127213631595127", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0xCF96210x6464640xCF9621")

    addComposingToDatabase(1400, composingid: 005038, bgpic: i005207!, firstposition: "393165207082", secondposition: "202338264195623330258203202593264203623593258203", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0xCF96210x6464640xCF9621")

    addComposingToDatabase(1120, composingid: 005043, bgpic: i005202!, firstposition: "533216292074", secondposition: "162380134186", thirdposition: "421365488149421582488149", imageposition: "", font:"Bradley Hand",color:"0xCF96210x6464640x646464")

    addComposingToDatabase(1220, composingid: 005048, bgpic: i005206!, firstposition: "150164700120", secondposition: "623343275156623604275156", thirdposition: "129298382231129574382231", imageposition: "", font:"Bradley Hand",color:"0xCF96210x6464640x646464")

    addComposingToDatabase(1202, composingid: 005053, bgpic: i005206!, firstposition: "398164196082", secondposition: "129298348223129574348223", thirdposition: "", imageposition: "668268202231668552202231", font:"Bradley Hand",color:"0xCF96210x6464640x646464")

    addComposingToDatabase(1240, composingid: 005058, bgpic: i005211!, firstposition: "398164207082", secondposition: "095343314104561611314104", thirdposition: "089500258119089649264111724328219082724440219082", imageposition: "", font:"Bradley Hand",color:"0xCF96210x6464640x646464")

    addComposingToDatabase(1440, composingid: 005063, bgpic: i005207!, firstposition: "393165202082", secondposition: "207293207060617293213060207571207060617571213060", thirdposition: "207383280120617383280120207661280120617661280120", imageposition: "", font:"Bradley Hand",color:"0xCF96210xCF96210x646464")

    addComposingToDatabase(1001, composingid: 005068, bgpic: i005212!, firstposition: "120320339374", secondposition: "", thirdposition: "", imageposition: "574320333374", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(1101, composingid: 005073, bgpic: i005209!, firstposition: "387164224074", secondposition: "134365308350", thirdposition: "", imageposition: "584365314350", font:"Bradley Hand",color:"0xCF96210x6464640xCF9621")

    addComposingToDatabase(2000, composingid: 005078, bgpic: i005212!, firstposition: "120320339374574320333374", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(0002, composingid: 005083, bgpic: i005212!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "120320339374574320333374", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(2200, composingid: 005088, bgpic: i005208!, firstposition: "084308185112719308185112", secondposition: "084496179278719496185278", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0xCF96210x6464640x646464")

    addComposingToDatabase(2202, composingid: 005093, bgpic: i005208!, firstposition: "073203191067730203191067", secondposition: "073308191157730308191157", thirdposition: "", imageposition: "073526191240730518191240", font:"Bradley Hand",color:"0xCF96210x6464640x646464")

    addComposingToDatabase(3000, composingid: 005098, bgpic: i005205!, firstposition: "235225595172235436601165235631595172", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(4004, composingid: 005103, bgpic: i005203!, firstposition: "196210275052640210275045202488275045640481275052", secondposition: "", thirdposition: "", imageposition: "168293320165612285320165174563320165612563320165", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(0004, composingid: 005108, bgpic: i005210!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "050335213261280335213261516335213261747335213261", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(4000, composingid: 005113, bgpic: i005210!, firstposition: "050335213261280335213261516335213261747335213261", secondposition: "", thirdposition: "", imageposition: "", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(0003, composingid: 005118, bgpic: i005210!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "067320269328370320275328674320275328", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    addComposingToDatabase(0001, composingid: 005123, bgpic: i005210!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "235276539440", font:"Bradley Hand",color:"0x6464640x6464640x646464")

    }
}
