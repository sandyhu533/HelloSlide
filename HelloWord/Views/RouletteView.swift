//
//  RouletteView.swift
//  SpeedSketch
//
//  Created by SandyHu on 2019/9/23.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SnapKit

protocol RouletteViewDelegate: NSObjectProtocol {
    func animationDidStart(_ anim: CAAnimation)
    func animationDidStop(_ anim: CAAnimation)
}

class RouletteView: UIView {
    
    weak var delegate: RouletteViewDelegate?
    // 元素视图
    private let cellsView = UIView()
    // 中间视图
    private let centerView = CenterView()
    // 转盘视图
    private let dialView = UIView()
    // 上次转动角度
    private var rotationAngle: CGFloat = 0
    // 动画是否正在执行
    private var isAnimating: Bool = false
    
    public var cells: [RouletteCell] = []
    
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
        addSubview(dialView)
        addSubview(centerView)
        dialView.addSubview(cellsView)
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(panRecognizer)
    }
    
    private func setupLayout() {
        dialView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(dialView.snp.width)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        centerView.snp.makeConstraints { (make) in
            make.width.height.equalTo(75)
            make.center.equalTo(dialView.snp.center)
        }
        
        cellsView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    deinit {
        dialView.layer.removeAnimation(forKey: "rotationAnimation")
    }
    
    @objc private func handlePan(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .ended{
            guard !isAnimating else { return }
            if recognizer.velocity(in: self.dialView).y < 0 {
                startAnimation(upOrDown: false)
            }else{
                startAnimation(upOrDown: true)
            }
        }
    }
    
    
    // 开始旋转动画
    func startAnimation(upOrDown: Bool) {
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        if upOrDown {
            animation.byValue = CGFloat.pi / 3
        }else{
            animation.byValue = -CGFloat.pi / 3
        }
        
        animation.duration = 0
        animation.isCumulative = false
        animation.delegate = self
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        reloadData()
        dialView.layer.add(animation, forKey: "rotationAnimation")
        
        cellsUpdate(upOrDown: upOrDown) //which updates dialView
    }
    
    func cellsUpdate(upOrDown: Bool){
        if !upOrDown {
            cells.insert(cells.first!, at: cells.count)
            cells.remove(at: 0)
        }else{
            cells.insert(cells.last!, at: 0)
            cells.remove(at: cells.count - 1)
        }
        self.centerView.set(image: cells[1].title)
    }
}

extension RouletteView {
    
    func set(cells: [RouletteCell]) {
        self.cells = cells
        reloadData()
        self.centerView.set(image: cells[1].title)
    }
    
    private func reloadData() {
        layoutIfNeeded()
        // 移除子视图
        for view in cellsView.subviews {
            view.removeFromSuperview()
        }
        // 添加 cellView 视图
        for (index,lottery) in cells.enumerated() {
            
            let ratio = CGFloat(1 / cells.count)
            let angle = (ratio > 0.5 ? 0.5 : ratio) * .pi
            let frame = CGRect(x: 0,
                               y: 0,
                               width: dialView.bounds.width / 2 * sin(angle),
                               height: dialView.bounds.height / 2)
            
            let cellView = CellView(frame: frame)
            cellView.layer.anchorPoint = CGPoint(x: 0.5, y: 1);
            cellView.center = CGPoint(x: dialView.bounds.width / 2,
                                      y: dialView.bounds.width / 2)
            cellView.set(title: lottery.title, image: lottery.image)
            
            let rotationAngle = CGFloat(CGFloat(2 * index + 1) / 6 * .pi )
            cellView.transform = CGAffineTransform(rotationAngle: rotationAngle)
            cellsView.addSubview(cellView)
        }
    }
    
}

extension RouletteView: CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
        isAnimating = true
        delegate?.animationDidStart(anim)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        isAnimating = false
        // dialView 旋转到当前位置
        dialView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5);
        dialView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        delegate?.animationDidStop(anim)
    }
}
