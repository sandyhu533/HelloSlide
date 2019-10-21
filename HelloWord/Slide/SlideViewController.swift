//
//  ViewController.swift
//  HelloWordSV0.0
//
//  Created by S Xu on 2019/9/13.
//  Copyright © 2019 S Xu. All rights reserved.
//

import UIKit

protocol SlideViewDelegate {
    func getNewPages(templateID: Int)->[Page]?
}


//class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
class SlideViewController: UIViewController{
    
    // 显示幻灯片的view
    @IBOutlet weak var pageCollectionView: UICollectionView! {
        didSet {
            // 根据明暗模式设置背景色
            if ColorModeModel.colorMode == .dark {
                pageCollectionView.backgroundColor = UIColor.GUNMETAL()
            } else {
                pageCollectionView.backgroundColor = UIColor.AZUREISH_WHITE()
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
    
    //自己的代理
    var slideViewDelegate : SlideViewDelegate?
    
    // pageCollectionView的代理
    var pageCollectionViewDelegate : PageCollectionViewDelegate?
    
    // designerCollectionView的代理
    var designerCollectionViewDelegate : DesignerCollectionViewDelegate?
    
    // 设计师模型
    var designerModel : DesignerModel?
    
    // 幻灯片模型
    var presentationModel : PresentationModel?
    
    // 来自parser的所有页面
    var pageViews : [Page]?

    // MARK: - Methods
    
    override func viewDidLoad() {
        mlog(message: "SlideView viewDidLoad", infoType: .DEBUG)
        
        // 创建设计师模型
        designerModel = DesignerModel()
        designerModel!.getDesigners()
        
        // 创建幻灯片模型
        presentationModel = PresentationModel()
        
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
//        changeDesigner()

    }
    
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        
        mlog(message: "view Will Appear", infoType: .DEBUG)
        
        presentationModel?.fillData(pageViews: pageViews!)

        // 刷新
        changeDesigner()

    }
    
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
        
        mlog(message: "refresh pageCollectionView", infoType: .DEBUG)

        pageCollectionView.collectionViewLayout.invalidateLayout()
        pageCollectionView.reloadData()

        pageCollectionView.setNeedsDisplay()

    }
    
    // 更换当页模版
    func changeTemplate(dir:Int,indexPath:IndexPath){
        
        // 根据indexPath找到页
        let page = presentationModel!.pages[indexPath.row]
        
        // MARK: - 请不要直接修改currrentSlideIndex 考虑两个函数
        page.lastSlideIndex = page.currentSlideIndex
        page.currentSlideIndex = (page.currentSlideIndex + dir + page.singleSlideViews.count) % page.singleSlideViews.count
        
        // 提示信息
        mlog(message: "page.currentSlide \(page.currentSlideIndex)", infoType: .CREATE_SLIDE)
        
        // 重新加载数据
        pageCollectionView.reloadItems(at: [indexPath])
        let cell = pageCollectionView.cellForItem(at: indexPath) as! PageCollectionViewCell
        cell.draw(cell.frame)
    }
    
    // 根据model中的记录更换设计师，或设计师的不同模版
    func changeDesigner() {
        
        // 获取model中记录数据
        let designerIndex = presentationModel?.selectedDesignerIndex
        let templateIndex = designerModel?.designerArray[designerIndex!].selectedTemplateIndex
        
        mlog(message: "designerIndex \(designerIndex!) templateIndex \(templateIndex!)", infoType: .DESIGNER_INFO)
        
        // model中更改设计师和模版：通过delegates重新获取presentationModel中的pages（当pages=0时模版不存在）
        let newPages = slideViewDelegate?.getNewPages(templateID: designerIndex!)
        print("~~~~~~~~~~~~designerIndex:\(designerIndex!)")
        if newPages?.count != 0{
            presentationModel?.pages = newPages!
        }
        
        // 获取颜色
        var lightCnt = 0
//        let pageNum = presentationModel!.pages.count
        for page in presentationModel!.pages{
            mlog(message: "获取颜色", infoType: .DEBUG)
            
            let img = page.singleSlideViews[0].asImage()
            
            var cnt = 0
            // 取三个点判断明暗
            
            if img.isLight(pos: CGPoint(x: 20,y: 20)){
                cnt+=1
            }
            if img.isLight(pos: CGPoint(x: 20,y: 100)){
                cnt+=1
            }
            if img.isLight(pos: CGPoint(x: img.size.width-10,y: img.size.height-20)){
                cnt+=1
            }
  
            if cnt>=2{
                lightCnt+=1
            }
        }
        
//        // 多数为亮色
//        if(lightCnt*2>pageNum){
//            print("深色模式 亮色\(lightCnt) 页数\(pageNum)")
//            ColorModeModel.colorMode = .dark
//            
//            // 换背景
//            pageCollectionView.backgroundColor = UIColor.GUNMETAL()
//        }else{
//            print("浅色模式 亮色\(lightCnt) 页数\(pageNum)")
//            ColorModeModel.colorMode = .light
//            
//            // 换背景
//            pageCollectionView.backgroundColor = UIColor.AZUREISH_WHITE()
//        }
        
        // 刷新设计师
        for cell in designerCollectionView.visibleCells{
            let designerCell = cell as! DesignerCollectionViewCell
            designerCell.refresh()
        }

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
        
//        self.view = self.presentationModel?.pages[0].singleSlideViews[0]
    }
    
    // 点击选择设计师
    @objc func tapOnDesignerCollectionView(_ sender: UITapGestureRecognizer) {
        
        // 获取点击处的设计师序号
        if let indexPath = designerCollectionView?.indexPathForItem(at: sender.location(in: designerCollectionView)) {
            
            mlog(message: "tap on designer \(presentationModel!.selectedDesignerIndex)->\(indexPath)", infoType: .DESIGNER_INFO)
            
            // 判断是否是同一个设计师
            if presentationModel!.selectedDesignerIndex == indexPath.row {
//                // 点击相同设计师，更换配色
//
//                // 获取当前设计师
//                let currentDesigner = designerModel!.designerArray[presentationModel!.selectedDesignerIndex]
//
//                // 更新模板
//                currentDesigner.selectedTemplateIndex = (currentDesigner.selectedTemplateIndex + 1) % currentDesigner.templates.count
//
//                // 刷新cell
//                designerCollectionView.reloadItems(at: [IndexPath(row: presentationModel!.selectedDesignerIndex, section: 0)])
//
//                // 更换设计师
//                changeDesigner()
                
                
                 
                 
                 // TODO: 测试 导出PPT到本地
//                 exportPPT()
                 
                 
                 
                 
                
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
    
    @IBAction func exportPPTAction(_ sender: Any) {
        exportPPT()
    }
    
    // MARK: - WEB
    func exportPPT(){
        
        var images:[UIImage] = []
        
        // 获取所有当前页
        for page in presentationModel!.pages{
            let slide = page.singleSlideViews[page.currentSlideIndex]
            images.append(slide.asImage())
        }
        
        mlog(message: "发送请求，导出PPT，共\(images.count)页", infoType: .DEBUG)
        
        let exPPT = ExPPT()
        exPPT.postJsonData(images: images, path: "/Documents/HelloWord.ppt", completion:{_ in
            mlog(message: "PPT下载完成", infoType: .DEBUG)
        })
    }
    
    func slideUpdate(pages: [Page]) {
        
        let newPages = pages
        if newPages.count != 0{
            presentationModel?.pages = newPages
        }
        refreshPageCollectionView()
    }
}
    

