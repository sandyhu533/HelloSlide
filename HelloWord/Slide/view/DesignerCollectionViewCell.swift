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
    
    func refresh() {
        // 设置大小
        designerView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        designerView.bounds = CGRect(x: 0, y: 0, width: 60, height: 60)
        
        // 背景透明
        designerView.backgroundColor = UIColor.clear
        designerView.alpha = 1
        
        self.backgroundView?.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        self.backgroundView?.bounds = CGRect(x: 0, y: 0, width: 60, height: 60)
        
        // 图标彩
        let iconColor = designer!.templates[designer!.selectedTemplateIndex].templateIconColor
        
        // 如果选中
        if designer!.isSelected == true {
            // 图标彩
            designerView.image = UIImage(named: designer!.imageName)?.tint(color: iconColor, blendMode: .destinationIn)
            
        }else{
            if ColorModeModel.colorMode == .light{
                // 图标白
                designerView.image = UIImage(named: designer!.imageName)?.tint(color: UIColor.AZUREISH_WHITE(), blendMode: .destinationIn)
                designerView.alpha = 0.8
            }else{
                // 图标黑
                designerView.image = UIImage(named: designer!.imageName)?.tint(color: UIColor.GUNMETAL(), blendMode: .destinationIn)
                designerView.alpha = 0.8
            }
        }
    }
    
    func setDesigner(_ designer : Designer) {
        
        self.designer = designer
        
        // 设置大小
        designerView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        designerView.bounds = CGRect(x: 0, y: 0, width: 60, height: 60)
        
        // 背景透明
        designerView.backgroundColor = UIColor.clear
        designerView.alpha = 1
        
        self.backgroundView?.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        self.backgroundView?.bounds = CGRect(x: 0, y: 0, width: 60, height: 60)
        
        // 图标彩
        let iconColor = designer.templates[designer.selectedTemplateIndex].templateIconColor
        
        // 如果选中
        if designer.isSelected == true {
            // 图标彩
            designerView.image = UIImage(named: designer.imageName)?.tint(color: iconColor, blendMode: .destinationIn)
            
        }else{
            if ColorModeModel.colorMode == .light{
                // 图标白
                designerView.image = UIImage(named: designer.imageName)?.tint(color: UIColor.AZUREISH_WHITE(), blendMode: .destinationIn)
                designerView.alpha = 0.4
            }else{
                // 图标黑
                designerView.image = UIImage(named: designer.imageName)?.tint(color: UIColor.GUNMETAL(), blendMode: .destinationIn)
                designerView.alpha = 0.4
            }

        }
        
    }
    
}
