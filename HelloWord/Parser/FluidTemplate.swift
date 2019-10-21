//
//  Template.swift
//  TestforSize3.0
//
//  Created by iOS_Club-29 on 2019/10/1.
//  Copyright © 2019 iOS_Club-29. All rights reserved.
//

import Foundation
struct FluidTemplate{
    var backurl:String=""
    var backcolor:String=""
    var fontcolor:String=""
    var font:String=""
    var strong:String=""
    
    var firstlayout = layoutway.layoutvertical
    var firstsecond:Double=0
    var firstsecondtype=composingtype.vertical
    var secondlayout=layoutway.layoutvertical
    var secondthird:Double=0
    var secondthirdtype=composingtype.vertical
    var thirdlayout=layoutway.layoutvertical
    
    
    var equallayout=true
    var myfontsize=fontsizemode.tobiggest
    
    
    var firstkuang=""
    var secondkuang=""
    var thirdkuang=""
    
    var zerofirstkuang=""
    var zerosecondkuang=""
    var zerothirdkuang=""
    
    var firstadmirefontmax=""
    var firstadmirefontmin=""
    var secondadmirefontmax=""
    var secondadmirefontmin=""
    var thirdadmirefontmax=""
    var thirdadmirefontmin=""
    

}

enum composingtype{
    case vertical
    case horizonal
    
}

enum layoutway{
    case layouthorizonal
    case layoutvertical
}

enum fontsizemode{
    case tobiggest
    case tosmallest
}

