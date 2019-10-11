//
//  PageCollectionViewDelegate.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/14.
//  Copyright © 2019 S Xu. All rights reserved.
//

import Foundation
import UIKit

class PageCollectionViewDelegate : NSObject, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    var presentationModel : PresentationModel
    var pageCollectionView : UICollectionView
    
    init(presentationModel : PresentationModel , pageCollectionView : UICollectionView) {
        self.presentationModel = presentationModel
        self.pageCollectionView = pageCollectionView
    }
    
    // 返回页数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presentationModel.pages.count
    }
    
    // 放置每一页
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 根据Identifier创建Cell
        // 强制类型转换为自定义Cell类型
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCell", for: indexPath) as! PageCollectionViewCell
        
        // 获取当前页
        let page = presentationModel.pages[indexPath.row]
        // 画出当前页
        cell.setPage(page)
        
        // 调试用
        mlog(message: "cell.frame \(cell.frame)", infoType: .SLIDE_LOCATION)
        mlog(message: "cell.bounds \(cell.bounds)", infoType: .SLIDE_LOCATION)
        
        // 提示信息
        mlog(message: "begin drawing page \(indexPath.row)", infoType: .CREATE_SLIDE)
        mlog(message: "画出当前页 page \(page.singleSlideViews[0].subviews)", infoType: .DEBUG)
        
        return cell
    }
    
    // 设置每个cell的大小(横向填满view并保持4:3)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 提示信息
        mlog(message: "calculate pageCell size", infoType: .SLIDE_LOCATION)
        mlog(message: "frame.size \(pageCollectionView.frame.size)", infoType: .SLIDE_LOCATION)
        
        // 获取collectionView大小
        let maxWidth = pageCollectionView.frame.size.width
        let maxHeight = pageCollectionView.frame.size.height
        
        // 调试用
        mlog(message: "frame.size \(pageCollectionView.frame.size)", infoType: .SLIDE_LOCATION)
        
        // 分别计算按宽高限制的4:3矩形大小
        let sizeW = CGSize(width: maxWidth, height: maxWidth*3/4)
        let sizeH = CGSize(width: maxHeight*4/3, height: maxHeight)
        
        var size = sizeH
        
        // 设置cell大小
        if (sizeW.width < sizeH.width){
            size = sizeW
        }
        
        // 调试用
        mlog(message: "cell size \(size)", infoType: .SLIDE_LOCATION)
        
        return size
    }
}
