//
//  ViewController.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/13.
//  Copyright © 2019 S Xu. All rights reserved.
//

import UIKit

//class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
class SlideViewController: UIViewController{
    
    // 显示幻灯片的view
    @IBOutlet weak var pageCollectionView: UICollectionView! {
        didSet {
            // 根据明暗模式设置背景色
            if ColorModeModel.colorMode == .dark {
                pageCollectionView.backgroundColor = UIColor.white
            } else {
                pageCollectionView.backgroundColor = UIColor.black
            }
            
            // 处理swipe动作，用于左右翻页
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeToLeft))
            swipeLeft.direction = [.left]
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeToRight))
            swipeRight.direction = [.right]
            
            // 将recognizer给view
            pageCollectionView.addGestureRecognizer(swipeLeft)
            pageCollectionView.addGestureRecognizer(swipeRight)
            
            // 处理点击动作，用于召出设计师界面
            let tapOnCollectionView = UITapGestureRecognizer(target: self, action: #selector(tapOnPageCollectionView))
            
            // 将recognizer给view
            pageCollectionView.addGestureRecognizer(tapOnCollectionView)
        }
    }
    
    // 显示设计师的view
    @IBOutlet weak var designerCollectionView: UICollectionView! {
        didSet {
            // 默认显示
            designerCollectionView.alpha = 1
            designerCollectionView.backgroundColor = UIColor.clear
            
            // 处理点击动作，用于更换设计师
            let tapOnDesignerView = UITapGestureRecognizer(target: self, action: #selector(tapOnDesignerCollectionView))
            
            // 将recognizer给view
            designerCollectionView.addGestureRecognizer(tapOnDesignerView)

        }
    }
    
    // pageCollectionView的代理
    var pageCollectionViewDelegate : PageCollectionViewDelegate?
    
    // designerCollectionView的代理
    var designerCollectionViewDelegate : DesignerCollectionViewDelegate?
    
    // 设计师模型
    var designerModel : DesignerModel?
    
    // 幻灯片模型
    var presentationModel : PresentationModel?
    
    // 来自parser的所有页面
    var pageViews : [PageView]?

    // MARK: - Methods
    
    override func viewWillAppear(_ animated: Bool) {
//
//    }
//
//    override func viewDidLoad() {
        super.viewWillAppear(animated)
        
        mlog(message: "here", infoType: .DEBUG)
        
        // 创建设计师模型
        designerModel = DesignerModel()
        designerModel!.getDesigners()
        
        // 创建幻灯片模型
        presentationModel = PresentationModel()
        
        // TODO: 测试时用
        presentationModel!.designerModel = designerModel
        
        // 默认使用0号设计师0号模板
//        presentationModel!.getPages(designerIndex: 0, templateIndex: 0)
        
        //使用从parser传过来的pageView创建page
        for pageView in pageViews!{
            let page = Page()
            page.addSlide(pageView)
            presentationModel!.pages.append(page)
        }
        
        // 创建pageColletionView的代理
        pageCollectionViewDelegate = PageCollectionViewDelegate(presentationModel: presentationModel!, pageCollectionView: pageCollectionView)
        
        // 设置pageColletionView的代理
        pageCollectionView.delegate = pageCollectionViewDelegate
        pageCollectionView.dataSource = pageCollectionViewDelegate

        // 初始化设计师数组
        designerModel!.getDesigners()
        
        // 创建designerCollectionView的代理
        designerCollectionViewDelegate = DesignerCollectionViewDelegate(designerModel : designerModel!, designerCollectionView : designerCollectionView)
        
        // 设置designerCollectionView的代理
        designerCollectionView.delegate = designerCollectionViewDelegate
        designerCollectionView.dataSource = designerCollectionViewDelegate
        
        // 默认选中0号设计师0号模板
        designerModel!.designerArray[0].isSelected = true

        // 刷新
        changeDesigner()
        
        // debug：设置为第一页幻灯片
        self.view = self.presentationModel!.pages[0].singleSlideViews[0]    }
    
    // 处理view大小改变，重新计算cell大小
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        mlog(message: "refresh", infoType: .DESIGNER_INFO)
        print("[in ViewController] viewWillTransition")
        
        // 刷新
        refreshPageCollectionView()
    }
    
    // TODO: view大小改变时刷新pageCollectionView以适应，刷新函数及效果暂未确定
    // 刷新pageCollectionView
    func refreshPageCollectionView () {
        
        mlog(message: "refresh", infoType: .DESIGNER_INFO)
        
//        pageCollectionView.layoutMarginsDidChange()
//        pageCollectionView.safeAreaInsetsDidChange()
//
        pageCollectionView.collectionViewLayout.invalidateLayout()
        pageCollectionView.reloadData()
//        pageCollectionView.reloadItems(at: pageCollectionView.indexPathsForVisibleItems)
//
//        pageCollectionView.contentMode = .redraw
        pageCollectionView.setNeedsDisplay()
//
//
//        for cell in pageCollectionView.visibleCells {
//
//
//            let pageCell = cell as! PageCollectionViewCell
//            pageCell.slideView.contentMode = .redraw
//            pageCell.slideView.setNeedsDisplay()
//
//        }
//
//        changeTemplate(dir: 0, indexPath: pageCollectionView.indexPathsForVisibleItems[0])
    }
    
    // 更换当页模版
    func changeTemplate(dir:Int,indexPath:IndexPath){
        
        // 根据indexPath找到页
        let page = presentationModel!.pages[indexPath.row]
        
        // 更新页数
        page.lastSlideIndex = page.currentSlideIndex
        page.currentSlideIndex = (page.currentSlideIndex + dir + page.singleSlideViews.count) % page.singleSlideViews.count
        
        // 提示信息
        mlog(message: "page.currentSlide \(page.currentSlideIndex)", infoType: .CREATE_SLIDE)
        
        // 重新加载数据
        pageCollectionView.reloadItems(at: [indexPath])
    }
    
    // 根据model中的记录更换设计师，或设计师的不同模版
    func changeDesigner() {
        
        // 获取model中记录数据
        let designerIndex = presentationModel?.selectedDesignerIndex
        let templateIndex = designerModel?.designerArray[designerIndex!].selectedTemplateIndex
        
        mlog(message: "designerIndex \(designerIndex!) templateIndex \(templateIndex!)", infoType: .DESIGNER_INFO)
        
        // model中更改设计师和模版
//        presentationModel?.getPages(designerIndex: designerIndex!, templateIndex: templateIndex!)
        
        // 刷新
        refreshPageCollectionView()
    }
    
    
    // MARK: - Gesture Methods
    
    // 处理向左滑动动作
    @objc func swipeToLeft(_ sender: UISwipeGestureRecognizer) {

        // 获取点击处的序号
        if let indexPath = pageCollectionView?.indexPathForItem(at: sender.location(in: pageCollectionView)) {
            // 更换模板
            changeTemplate(dir:-1,indexPath:indexPath)
        }
    }
    
    // 处理向右滑动动作
    @objc func swipeToRight(_ sender: UISwipeGestureRecognizer) {

        // 获取点击处的序号
        if let indexPath = pageCollectionView?.indexPathForItem(at: sender.location(in: pageCollectionView)) {
            // 更换模板
            changeTemplate(dir:1,indexPath:indexPath)
        }
    }
    
    // 点击召出或收起设计师界面
    @objc func tapOnPageCollectionView() {
        
        // 判断设计师界面状态
        if designerCollectionView.alpha == 0 {
            // 隐藏则召出
            mlog(message: "show designer view", infoType: .DESIGNER_INFO)
            
            // 设置透明度
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations:  {
                self.designerCollectionView.alpha = 1
            }, completion: nil)
        }
        else {
            // 显示则隐藏
            mlog(message: "hide designer view", infoType: .DESIGNER_INFO)
            
            // 设置透明度
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations:  {
                self.designerCollectionView.alpha = 0
            }, completion: nil)
        }

        // 刷新pageCollectionView
        refreshPageCollectionView()
    }
    
    // 点击选择设计师
    @objc func tapOnDesignerCollectionView(_ sender: UITapGestureRecognizer) {
        
        // 获取点击处的设计师序号
        if let indexPath = designerCollectionView?.indexPathForItem(at: sender.location(in: designerCollectionView)) {
            
            mlog(message: "tap on designer \(presentationModel!.selectedDesignerIndex)->\(indexPath)", infoType: .DESIGNER_INFO)
            
            // 判断是否是同一个设计师
            if presentationModel!.selectedDesignerIndex == indexPath.row {
                // 点击相同设计师，更换配色
                
                // 获取当前设计师
                let currentDesigner = designerModel!.designerArray[presentationModel!.selectedDesignerIndex]
                
                // 更新模板
                currentDesigner.selectedTemplateIndex = (currentDesigner.selectedTemplateIndex + 1) % currentDesigner.templates.count
                
                // 刷新cell
                designerCollectionView.reloadItems(at: [IndexPath(row: presentationModel!.selectedDesignerIndex, section: 0)])
                
                // 更换设计师
                changeDesigner()
            }
            else {
                // 点击不同设计师，更换模板
                
                // 取消之前设计师的选择
                designerModel?.designerArray[presentationModel!.selectedDesignerIndex].isSelected = false
                
                // 选中点击的设计师
                designerModel?.designerArray[indexPath.row].isSelected = true
                
                // 刷新两个cell
                designerCollectionView.reloadItems(at: [IndexPath(row: presentationModel!.selectedDesignerIndex, section: 0)])
                designerCollectionView.reloadItems(at: [indexPath])
                
                // 记录当前设计师
                presentationModel!.selectedDesignerIndex = indexPath.row
                
                // 更换设计师
                changeDesigner()
                
            }
        }
    }
    
}

