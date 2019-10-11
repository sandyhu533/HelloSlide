//
//  DesignerCollectionViewCell.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/15.
//  Copyright © 2019 S Xu. All rights reserved.
//

import UIKit

class DesignerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var designerView: UIImageView!
    
    var designer : Designer?
    
    func setDesigner(_ designer : Designer) {
        
        self.designer = designer
        
        // 设置大小
        designerView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        designerView.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
        
        // 背景透明
        designerView.backgroundColor = UIColor.clear
        designerView.alpha = 1
        
        self.backgroundView?.alpha = 0
        
        // 加载图片，如果不存在，显示空白
        if ColorModeModel.colorMode == .light {
            // 白色图标
            designerView.image = UIImage(named: designer.imageName)?.tint(color: UIColor.white, blendMode: .destinationIn)
            
        } else {
            // 黑色图标
            designerView.image = UIImage(named: designer.imageName)?.tint(color: UIColor.black, blendMode: .destinationIn)
        }
        
        // 如果选中
        if designer.isSelected == true {
            
            // 获取图标颜色
            let iconColor = designer.templates[designer.selectedTemplateIndex].templateIconColor
            
            // 设置图标颜色
            designerView.image = designerView.image?.tint(color: iconColor, blendMode: .destinationIn)
            
            // 设置背景颜色
            if ColorModeModel.colorMode == .light {
                // 白色背景图片
                self.backgroundView = UIImageView(image: UIImage(named: "avatarbackground")?.tint(color: UIColor.white, blendMode: .destinationIn))
                self.backgroundView?.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
                self.backgroundView?.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
                self.backgroundView?.alpha = 0.6
                
            } else {
                // 黑色背景图片
                self.backgroundView = UIImageView(image: UIImage(named: "avatarbackground")?.tint(color: UIColor.black, blendMode: .destinationIn))
                self.backgroundView?.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
                self.backgroundView?.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
                self.backgroundView?.alpha = 0.6
                
            }
            
        }

    }
    
}
