//
//  DesignerCollectionViewDelegate.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/14.
//  Copyright © 2019 S Xu. All rights reserved.
//

import Foundation
import UIKit

class DesignerCollectionViewDelegate : NSObject, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    var designerModel : DesignerModel
    var designerCollectionView : UICollectionView
    
    init(designerModel : DesignerModel, designerCollectionView : UICollectionView) {
        self.designerModel = designerModel
        self.designerCollectionView = designerCollectionView
    }
    
    // 返回设计师个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return designerModel.designerArray.count
    }

    // 返回每个位置的设计师cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 根据Identifier创建Cell
        // 强制类型转换为自定义Cell类型
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DesignerCell", for: indexPath) as! DesignerCollectionViewCell
        
        // 获取当前设计师
        let designer = designerModel.designerArray[indexPath.row]
        // 设置当前设计师
        cell.setDesigner(designer)
        
        return cell
    }


}
