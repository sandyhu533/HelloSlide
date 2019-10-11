//
//  PageCollectionViewCell.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/13.
//  Copyright © 2019 S Xu. All rights reserved.
//

import UIKit
import os.log

class PageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideView: UIView!
    
    var page : Page?
    var background : UIView?
    
    // 设置页
    func setPage(_ page : Page){
        // 设置页
        self.page = page
        
        // 加入subview
        for subView in page.singleSlideViews {
            slideView.addSubview(subView)
        }
        
        // 设置背景
        background = page.singleSlideViews[(page.currentSlideIndex)].initview
        background?.frame = self.bounds
        background?.bounds = self.bounds
        slideView.addSubview(background!)

        // 设置0页大小
        page.singleSlideViews[0].frame = self.bounds
        page.singleSlideViews[0].bounds = self.bounds
        
        // 重画0页
        page.singleSlideViews[0].draw(slideView.bounds)
        
        // 默认显示0号模板
        slideView.bringSubviewToFront(page.singleSlideViews[0])
        
    }
    
    override func draw(_ rect: CGRect) {

        // 提示信息
        mlog(message: "drawing template \(page!.lastSlideIndex) -> \(page!.currentSlideIndex)", infoType: .CREATE_SLIDE)
        
        // 根据cell大小调整slideView大小
        // 初始化时，有时frame左上角不为0
        slideView.frame = self.bounds
        slideView.bounds = self.bounds
        
        // 调整背景大小
        background?.frame = self.bounds
        background?.bounds = self.bounds
        
        // 判断是否换页
        if page?.lastSlideIndex != page?.currentSlideIndex {
            // 获取旧页
            let oldSingleSlideView = page?.singleSlideViews[(page?.lastSlideIndex)!]
            
            // 获取新页
            let newSingleSlideView = page?.singleSlideViews[(page?.currentSlideIndex)!]
            
            // 设置新页大小
            newSingleSlideView?.frame = self.bounds
            newSingleSlideView?.bounds = self.bounds
            
            // 重画新页
            newSingleSlideView?.draw(slideView.bounds)
            
            // 翻页
            UIView.transition(
                from: oldSingleSlideView!,
                to: newSingleSlideView!,
                // TODO: 翻页时设置持续时间出现显示混乱问题，暂时不设动画
                duration: 0,
                options: [.curveEaseInOut],
                completion: nil)
            
        }
        
    }

}
