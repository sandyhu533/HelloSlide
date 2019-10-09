//
//  Page.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/13.
//  Copyright © 2019 S Xu. All rights reserved.
//

import Foundation
import UIKit

class Page
{
    
//    var slides = [PageView]()
    var singleSlideViews = [PageView]()
    var currentSlideIndex = 0
    var lastSlideIndex = 0
    
    // 模板个数
    func countSlides()->Int {
        return singleSlideViews.count
    }
    
    // 添加Slide
    func addSlide(_ newSlide:PageView) {
        // 加入slides
//        slides.append(newSlide)
        
        // 创建对应的view
        singleSlideViews.append(newSlide)
    }
    
//    // 根据给定的slide创建view
//    func createView(_ slide:PageView) -> PageView {
////        // 新建view
////        let newView = SingleSlideView()
////        newView.slide = slide
////
////        // 设置背景
////        let background = slide.background
////        if (background != nil) {
////            newView.addSubview(background!)
////        }
////
////        // 设置元素
////        for element in slide.elements {
////            newView.addSubview(element)
////        }
//
//        return slide
//    }
    
}
