//
//  CenterView.swift
//  SpeedSketch
//
//  Created by SandyHu on 2019/9/23.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SnapKit

class CenterView: UIView {
    
    private let imageView = UIImageView()
    private var baseAngle: CGFloat = 0
    private var radius: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        setupLayout()
    }
    
    private func setup() {
        addSubview(imageView)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { (make) in
            make.height.equalTo(83)
            make.width.equalTo(83)
            make.center.equalToSuperview()
        }
    }
    
    func set(image: String) {
        imageView.image = UIImage(imageLiteralResourceName: image)
    }
    
}
