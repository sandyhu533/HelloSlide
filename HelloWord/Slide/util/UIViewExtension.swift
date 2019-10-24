//
//  UIViewExtension.swift
//  HelloWord
//
//  Created by S Xu on 2019/10/17.
//  Copyright © 2019 HelloWord. All rights reserved.
//

import UIKit
 
extension UIView {
    //将当前视图转为UIImage
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
