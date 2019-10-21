//
//  AddDatabase.swift
//  HelloWord
//
//  Created by S Xu on 2019/10/16.
//  Copyright © 2019 HelloWord. All rights reserved.
//

import Foundation
import UIKit
func loadData(){
//    deleteobject(pageinfo: 001006)
//    deleteobject(pageinfo: 001001)
//
//
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
    
    
    
    addComposingToDatabase(1000, composingid: 001001, bgpic: i001001!, firstposition: "291333437347", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1000, composingid: 001006, bgpic: i001010!, firstposition: "218152562104", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1000, composingid: 001011, bgpic: i001005!, firstposition: "151270593388", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1100, composingid: 001016, bgpic: i001002!, firstposition: "072347218347", secondposition: "447291489458", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1100, composingid: 001021, bgpic: i001001!, firstposition: "302250395104", secondposition: "250423500291", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0xffffff0x9b9b9b")

    addComposingToDatabase(1200, composingid: 001026, bgpic: i001002!, firstposition: "072347218347", secondposition: "427208510236427513510236", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1200, composingid: 001031, bgpic: i001007!, firstposition: "411250244513", secondposition: "687250244513098354177298", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1300, composingid: 001036, bgpic: i001002!, firstposition: "072347218347", secondposition: "416097531208416375531208416652531208", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1300, composingid: 001041, bgpic: i001011!, firstposition: "687305250388", secondposition: "067097484236067375484236067652484236", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1400, composingid: 001046, bgpic: i001005!, firstposition: "281145348131", secondposition: "145319281201489319281208145562281201489562281201", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0xffffff0x9b9b9b")

    addComposingToDatabase(1400, composingid: 001051, bgpic: i001008!, firstposition: "088347192347", secondposition: "442090234354713090239354442493234354713493239354", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1120, composingid: 001056, bgpic: i001002!, firstposition: "072347218347", secondposition: "416125510236", thirdposition: "427458218347708458218347", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1120, composingid: 001061, bgpic: i001003!, firstposition: "437125317097", secondposition: "239250515083", thirdposition: "182381260368494381260368", imageposition: "", font:"Arial",color:"0xffffff0xffffff0xc8c8c8")

    addComposingToDatabase(1220, composingid: 001066, bgpic: i001006!, firstposition: "078361208291", secondposition: "421208229145692208223145", thirdposition: "421423223340692423223340", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1220, composingid: 001071, bgpic: i001005!, firstposition: "250138406125", secondposition: "109312312104479312317104", thirdposition: "109458312291479458317291", imageposition: "", font:"Arial",color:"0xffffff0xffffff0xc8c8c8")

    addComposingToDatabase(1240, composingid: 001076, bgpic: i001008!, firstposition: "083361203298", secondposition: "401173255069682173255069", thirdposition: "401291255250682291255243083361203298401576255243", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1240, composingid: 001081, bgpic: i001002!, firstposition: "078326213354", secondposition: "421041125430421520125430", thirdposition: "578041348187578284348187578520348187578756348187", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1440, composingid: 001086, bgpic: i001008!, firstposition: "078361208270", secondposition: "432055223069692055223069432513223069692513223069", thirdposition: "432159223270692159223270432618223270692618223270", imageposition: "", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1440, composingid: 001091, bgpic: i001003!, firstposition: "250118395111", secondposition: "151277276048468277276048151562276048468562276048", thirdposition: "151361276159468361276159151645276159468645276159", imageposition: "", font:"Arial",color:"0xffffff0xffffff0xc8c8c8")

    addComposingToDatabase(1001, composingid: 001096, bgpic: i001011!, firstposition: "708319203333", secondposition: "", thirdposition: "", imageposition: "072208479555", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1001, composingid: 001101, bgpic: i001003!, firstposition: "218645557145", secondposition: "", thirdposition: "", imageposition: "265166463437", font:"Arial",color:"0xffffff0xffffff0xc8c8c8")

    addComposingToDatabase(1002, composingid: 001106, bgpic: i001007!, firstposition: "067340234298", secondposition: "", thirdposition: "", imageposition: "479048385409479500385409", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1002, composingid: 001111, bgpic: i001002!, firstposition: "072340223305", secondposition: "", thirdposition: "", imageposition: "390312270361687312270361", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1101, composingid: 001116, bgpic: i001006!, firstposition: "083375203243", secondposition: "432645484118", thirdposition: "", imageposition: "468222411381", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1101, composingid: 001121, bgpic: i001005!, firstposition: "218590437097", secondposition: "156722557083", thirdposition: "", imageposition: "218194437340", font:"Arial",color:"0xffffff0xffffff0xc8c8c8")

    addComposingToDatabase(1202, composingid: 001126, bgpic: i001008!, firstposition: "088347192347", secondposition: "442090234354713493239354", thirdposition: "", imageposition: "713090239354437500239347", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(1202, composingid: 001131, bgpic: i001011!, firstposition: "708340203270", secondposition: "036576255215322576260215", thirdposition: "", imageposition: "036236255291322236260291", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(2000, composingid: 001136, bgpic: i001003!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "104305328361463305328361", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(2000, composingid: 001141, bgpic: i001005!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "427138328340145513328340", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(2200, composingid: 001146, bgpic: i001009!, firstposition: "041111114333041513114333", secondposition: "182111265333182513265333", thirdposition: "", imageposition: "", font:"Arial",color:"0x9b9b9b0x9b9b9b0x9b9b9b")

    addComposingToDatabase(2200, composingid: 001151, bgpic: i001009!, firstposition: "515152296090140298296090", secondposition: "515298296305140437296298", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(2202, composingid: 001156, bgpic: i001005!, firstposition: "484131302069130277307076", secondposition: "484569302145130715307145", thirdposition: "", imageposition: "484256302250130402307256", font:"Arial",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(2202, composingid: 001161, bgpic: i001006!, firstposition: "083305208138083548208138", secondposition: "427104161368427527161361", thirdposition: "", imageposition: "630104307368630527307361", font:"Arial",color:"0xffffff0x9b9b9b0x9b9b9b")

    addComposingToDatabase(3000, composingid: 001166, bgpic: i001009!, firstposition: "046069390229046375390222046666390229", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0x9b9b9b0x9b9b9b0x9b9b9b")

    addComposingToDatabase(3000, composingid: 001171, bgpic: i001003!, firstposition: "385125411201260381416201125625411208", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(4000, composingid: 001176, bgpic: i001003!, firstposition: "171159296291489159296291098527296284416527296284", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(4000, composingid: 001181, bgpic: i001005!, firstposition: "135208140548307208140548479208140548651208140548", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(4004, composingid: 001186, bgpic: i001003!, firstposition: "177437239076177805239076510368239076510736239076", secondposition: "", thirdposition: "", imageposition: "177180239222177548239222510118239215510486239215", font:"Arial",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(0001, composingid: 001191, bgpic: i001004!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "270298411388", font:"Arial",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(0001, composingid: 001196, bgpic: i001001!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "270298411388", font:"Arial",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(0002, composingid: 001201, bgpic: i001003!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "104305328361463305328361", font:"Arial",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(0002, composingid: 001206, bgpic: i001005!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "427138328340145513328340", font:"Arial",color:"0xffffff0xffffff0xffffff")

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
    
    addComposingToDatabase(1000, composingid: 002001, bgpic: i002001!, firstposition: "175654666187", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1100, composingid: 002006, bgpic: i002002!, firstposition: "372203259127", secondposition: "372406259406", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(1100, composingid: 002011, bgpic: i002003!, firstposition: "079112367135", secondposition: "548172389661", thirdposition: "", imageposition: "", font:"Arial",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1200, composingid: 002016, bgpic: i002005!, firstposition: "242052531112", secondposition: "180375276503649375276503", thirdposition: "", imageposition: "", font:"Arial",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1220, composingid: 002021, bgpic: i002003!, firstposition: "067082322187", secondposition: "508105209142751105209142", thirdposition: "508293209571751293209571", imageposition: "", font:"Arial",color:"0x3131310xCC00FF0x313131")

    addComposingToDatabase(1300, composingid: 002026, bgpic: i002006!, firstposition: "045586197338", secondposition: "259067740255395368604255531669468255", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0x3131310x313131")

    addComposingToDatabase(1400, composingid: 002031, bgpic: i002004!, firstposition: "299045429120", secondposition: "163323293203621323293203163601293210621601293210", thirdposition: "", imageposition: "", font:"Arial",color:"0xCC00FF0x3131310x313131")

    addComposingToDatabase(1120, composingid: 002036, bgpic: i002002!, firstposition: "372203259127", secondposition: "372406259406", thirdposition: "039406259406706406259406", imageposition: "", font:"Arial",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(1240, composingid: 002041, bgpic: i002007!, firstposition: "288037412127", secondposition: "310233276127412759282127", thirdposition: "073398282142073661282187666263276187666578276150", imageposition: "", font:"Arial",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(1440, composingid: 002046, bgpic: i002008!, firstposition: "316045401127", secondposition: "096248186075305248192075514248192075723248192075", thirdposition: "096631186285305631186285514631192285723631192285", imageposition: "", font:"Arial",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1001, composingid: 002051, bgpic: i002009!, firstposition: "084172248593", secondposition: "", thirdposition: "", imageposition: "435225451488", font:"Arial",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(1002, composingid: 002056, bgpic: i002010!, firstposition: "378150237654", secondposition: "", thirdposition: "", imageposition: "033248310451649248310451", font:"Arial",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1101, composingid: 002061, bgpic: i002011!, firstposition: "101082350142", secondposition: "536157395578", thirdposition: "", imageposition: "101330350451", font:"Arial",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1202, composingid: 002066, bgpic: i002007!, firstposition: "288037423127", secondposition: "022669259090677345259090", thirdposition: "", imageposition: "022248259308677593254300", font:"Arial",color:"0x3131310x3131310x313131")

    addComposingToDatabase(2000, composingid: 002071, bgpic: i002009!, firstposition: "045195418533536195412533", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(0002, composingid: 002076, bgpic: i002009!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "045195418533536195412533", font:"Arial",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(0001, composingid: 002081, bgpic: i002009!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "231180548586", font:"Arial",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(2200, composingid: 002086, bgpic: i002012!, firstposition: "050150288240158601282233", secondposition: "401082598390502518497398", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0x3131310x313131")

    addComposingToDatabase(2202, composingid: 002091, bgpic: i002005!, firstposition: "079045350120525045350120", secondposition: "169248254210615248254210", thirdposition: "", imageposition: "079518338398531518338398", font:"Arial",color:"0x3131310x3131310x313131")

    addComposingToDatabase(0003, composingid: 002096, bgpic: i002010!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "022218299466350218305466683218299466", font:"Arial",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(0004, composingid: 002101, bgpic: i002010!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "135037299360135443299353570195299353570593299360", font:"Arial",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(4004, composingid: 002106, bgpic: i002002!, firstposition: "355165293127355338293127355518293127355691293127", secondposition: "", thirdposition: "", imageposition: "045097259338045556259330700097259338700556259338", font:"Arial",color:"0xffffff0xffffff0x313131")

    addComposingToDatabase(3000, composingid: 002111, bgpic: i002006!, firstposition: "259067740255395368604255531669468255", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0x3131310x3131310x313131")

    addComposingToDatabase(4000, composingid: 002116, bgpic: i002004!, firstposition: "163323293203621323293203163601293210621601293210", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0xCC00FF0x3131310x313131")


    // MARK: - 003
    let i003001 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003001", ofType: "png")!)
    let i003002 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003002", ofType: "png")!)
    let i003003 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003003", ofType: "png")!)
    let i003004 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003004", ofType: "png")!)
    let i003005 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003005", ofType: "png")!)
    let i003006 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003006", ofType: "png")!)
    let i003007 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003007", ofType: "png")!)
    let i003008 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003008", ofType: "png")!)
//    let i003009 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i003009", ofType: "png")!)
    

     addComposingToDatabase(1000, composingid: 003001, bgpic: i003001!, firstposition: "180703652203", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0x4444430x4444430x444443")

        
    addComposingToDatabase(1100, composingid: 003006, bgpic:  i003001!, firstposition: "180703652203", secondposition: "18290670090", thirdposition: "", imageposition: "", font:"Arial",color:"0x0000000x4444430x000000")

    
     addComposingToDatabase(2000, composingid: 003011, bgpic: i003002!, firstposition: "361074513314361462513333", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0x4444430x4444430x444443")

     
    addComposingToDatabase(1300, composingid: 003016, bgpic: i003003!, firstposition: "166018736148", secondposition: "041629277240375629277240694629263240",thirdposition: "", imageposition: "",font:"Arial",color:"0x4444430x4444430x444443")

       
    addComposingToDatabase(1120, composingid: 003021, bgpic: i003004!, firstposition: "097018791111", secondposition: "069296750129", thirdposition: "041759416148527759430148", imageposition: "", font:"Arial",color:"0x0000000x4444430x444443")

     
    addComposingToDatabase(1220, composingid: 003026, bgpic: i003005!, firstposition: "069037875092", secondposition: "041555416185527555444185", thirdposition: "041796375129527796416129", imageposition: "", font:"Arial",color:"0xffffff0x4444430x444443")

     
     addComposingToDatabase(1440, composingid: 003031, bgpic: i003006!, firstposition: "125037694129", secondposition: "027277416074541277430074041666402092555648416092", thirdposition: "027425416129541425444129027833430129555833430129", imageposition: "", font:"Arial",color:"0xffffff0x4444430x444443")

     
    addComposingToDatabase(1101, composingid: 003036, bgpic: i003007!, firstposition: "250037680148", secondposition: "236277680111", thirdposition: "", imageposition: "250481680407", font:"Arial",color:"0xffffff0x4444430x444443")

    
    addComposingToDatabase(0002, composingid: 003041, bgpic: i003008!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "555129375722055148333703", font:"Arial",color:"0xffffff0xffffff0x313131")

    
    addComposingToDatabase(0004, composingid: 003046, bgpic: i003008!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "013111319370666092319370013574319333652555333351", font:"Arial",color:"0x3131310x3131310x313131")

     
    addComposingToDatabase(1100, composingid: 003051, bgpic: i003006!, firstposition: "236259583185", secondposition: "097537833203", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0x4444430x444443")

     addComposingToDatabase(1200, composingid: 003056, bgpic: i003003!, firstposition: "020055139268", secondposition: "363111496259363509496259", thirdposition: "", imageposition: "", font:"Arial",color:"0x4444430x4444430x444443")
                     
    
    // MARK: - 004
    
    let i004001 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i004001", ofType: "png")!)
//    let i004002 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i004002", ofType: "png")!)
    let i004003 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i004003", ofType: "png")!)
    let i004004 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i004004", ofType: "png")!)
    let i004005 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i004005", ofType: "png")!)
    let i004006 = UIImage(contentsOfFile: Bundle.main.path(forResource: "i004006", ofType: "png")!)
    
    addComposingToDatabase(1100, composingid: 004001, bgpic: i004001!, firstposition: "373381597229", secondposition: "224679775152", thirdposition: "", imageposition: "", font:"Arial",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1000, composingid: 004006, bgpic: i004001!, firstposition: "258664488190", secondposition: "", thirdposition: "", imageposition: "", font:"Arial",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1200, composingid: 004011, bgpic: i004003!, firstposition: "402330195369", secondposition: "109253252530637253252530", thirdposition: "", imageposition: "", font:"Arial",color:"0x3131310xffffff0xffffff")

    addComposingToDatabase(1300, composingid: 004016, bgpic: i004004!, firstposition: "321106350137", secondposition: "120351224450385351224450649351229450", thirdposition: "", imageposition: "", font:"Arial",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(1120, composingid: 004021, bgpic: i004003!, firstposition: "402146201207", secondposition: "413415178346", thirdposition: "103276264507632276270507", imageposition: "", font:"Arial",color:"0x3131310x3131310x313131")

    addComposingToDatabase(1120, composingid: 004026, bgpic: i004005!, firstposition: "281671436160", secondposition: "086076327145597076327145", thirdposition: "086267327328597267327328", imageposition: "", font:"Arial",color:"0xffffff0x3131310x313131")

    addComposingToDatabase(1440, composingid: 004031, bgpic: i004006!, firstposition: "344061425107", secondposition: "218300310053586292310053218638310053586638310053", thirdposition: "218376310169586376310169218723310169586715310176", imageposition: "", font:"Arial",color:"0x3131310x50C5CE0x313131")

    addComposingToDatabase(1101, composingid: 004036, bgpic: i004004!, firstposition: "103114408106", secondposition: "103259758061", thirdposition: "", imageposition: "206396563465", font:"Arial",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(0002, composingid: 004041, bgpic: i004003!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "091276293438626276287438", font:"Arial",color:"0xffffff0xffffff0xffffff")

    addComposingToDatabase(0004, composingid: 004046, bgpic: i004004!, firstposition: "", secondposition: "", thirdposition: "", imageposition: "097129362320540129362320097557362320540557362320", font:"Arial",color:"0xffffff0xffffff0xffffff")


}
