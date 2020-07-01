/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The primary view controller.
 */

import UIKit
import CoreData

class OutlineViewController: UIViewController, RouletteViewDelegate {
    
//    var document: Document?
    var parser: Parser!
    var OCR: OCRModel!
    
    var lastModeName = String("cvm.FirstClass")
    var selectedCellIndex: Int?
    var models: [NSAttributedString] = []
    var ocr: Bool?
    var isIntialized = false
    var cellConsistentDelegate: CellConsistentDelegate?
    
    var cgView: StrokeCGView!
    var pencilStrokeRecognizer: StrokeGestureRecognizer!
    var rouletteView: RouletteView!
    
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var strokeCollection = StrokeCollection()
    var canvasContainerView: CanvasContainerView!
    
    override func viewWillAppear(_ animated: Bool) {
        if isIntialized == false{
//            //读取文件进行初始化
//            document?.open(completionHandler: { (success) in
                self.readFile()
//            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()

        if models.count == 0{
            models.append(NSAttributedString())
        }
        
        //将Models的代理设置为自己
        if WordModelManager.shared.lock0 == 0 {
            WordModelManager.wordModelManagerDelegete0 = self
            WordModelManager.shared.outlineViewController0 = self
        } else {
            WordModelManager.wordModelManagerDelegete1 = self
            WordModelManager.shared.outlineViewController1 = self
        }
        WordModelManager.shared.lock0 = 1
        
        selectedCellIndex = 0
        
        //解析器
        self.parser = Parser()
        self.OCR = OCRModel()
        
        // TODO: 此处传的是OutlineView的大小
//        parser.bounds = self.view.bounds
        parser.bounds = CGRect(x: 0, y: 0, width: 800, height: 600)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 500
        
        //手指和pencil分别的recognizer
        //        self.fingerStrokeRecognizer = setupStrokeGestureRecognizer(isForPencil: false)
        self.pencilStrokeRecognizer = setupStrokeGestureRecognizer(isForPencil: true)
        
        if #available(iOS 12.1, *) {
            let pencilInteraction = UIPencilInteraction()
            pencilInteraction.delegate = self as? UIPencilInteractionDelegate
            view.addInteraction(pencilInteraction)
        }
        
        //        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(reloadAndSaveData), userInfo: nil, repeats: true)
        
        //监听rouletteView
        setupDrawingBoard()
        setupRouletteBar()
        setupDrawingToolBar()
        setupPencilUI()
        createObservers()
    }
    
    @objc func reloadAndSaveData(){
        tableView.reloadData()
//        document?.attributedStringArray = models
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    // MARK: - Set Up RouletteBar
    func setupRouletteBar(){
        let rouletteCells = [
            RouletteCell(title: "Passage", image: "Passage"),
            RouletteCell(title: "FirstClass", image: "FirstClass"),
            RouletteCell(title: "SecondClass", image: "SecondClass"),
            RouletteCell(title: "Passage", image: "Passage"),
            RouletteCell(title: "FirstClass", image: "FirstClass"),
            RouletteCell(title: "SecondClass", image: "SecondClass"),]
        
        self.rouletteView = RouletteView()
        view.addSubview(rouletteView)
        rouletteView.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.centerY.equalToSuperview()
            make.centerX.equalTo(0)
        }
        rouletteView.delegate = self
        rouletteView.set(cells: rouletteCells)
    }
    
    func animationDidStart(_ anim: CAAnimation) {}
    func animationDidStop(_ anim: CAAnimation) {}
    
    // MARK: - Set Up DrawingToolBar
    func setupDrawingToolBar(){
        
        self.containerStackView.spacing = 15
        
        let textModeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        textModeButton.setImage(UIImage(named: "Text"), for: .normal)
        textModeButton.imageView?.contentMode = .scaleAspectFit
        textModeButton.setImage(UIImage(named: "Text"), for: .selected)
        textModeButton.setBackgroundImage(UIImage(named: "Bg"), for: .selected)
        textModeButton.addTarget(self, action: #selector(buttonSelected), for: .allTouchEvents)
        textModeButton.addTarget(self, action: #selector(textMode), for: .allTouchEvents)
        let width2 = NSLayoutConstraint(item: textModeButton, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        textModeButton.addConstraint(width2)
        self.containerStackView.addArrangedSubview(textModeButton)
        
        let writeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        writeButton.setImage(UIImage(named: "Write"), for: .normal)
        writeButton.imageView?.contentMode = .scaleAspectFit
        writeButton.setBackgroundImage(UIImage(named: "Bg"), for: .selected)
        writeButton.addTarget(self, action: #selector(buttonSelected), for: .allTouchEvents)
        writeButton.addTarget(self, action: #selector(pencilMode_), for: .allTouchEvents)
        let width1 = NSLayoutConstraint(item: writeButton, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        writeButton.addConstraint(width1)
        self.containerStackView.addArrangedSubview(writeButton)
        
        let fileButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        fileButton.setImage(UIImage(named: "Image"), for: .normal)
        fileButton.imageView?.contentMode = .scaleAspectFit
        fileButton.addTarget(self, action: #selector(buttonSelected), for: .allTouchEvents)
        fileButton.addTarget(self, action: #selector(importFile), for: .allTouchEvents)
        let width4 = NSLayoutConstraint(item: fileButton, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        fileButton.addConstraint(width4)
        self.containerStackView.addArrangedSubview(fileButton)
        
        let pencilDisableButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        pencilDisableButton.setImage(UIImage(named: "PencilDisable"), for: .normal)
        pencilDisableButton.imageView?.contentMode = .scaleAspectFit
        pencilDisableButton.setImage(UIImage(named: "PencilDisable"), for: .selected)
        pencilDisableButton.setBackgroundImage(UIImage(named: "Bg"), for: .selected)
        pencilDisableButton.addTarget(self, action: #selector(buttonSelected), for: .allTouchEvents)
        pencilDisableButton.addTarget(self, action: #selector(pencilOrTextDisable), for: .allTouchEvents)
        let width5 = NSLayoutConstraint(item: pencilDisableButton, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        pencilDisableButton.addConstraint(width5)
        self.containerStackView.addArrangedSubview(pencilDisableButton)

        self.navigationItem.titleView = self.containerStackView
        for item in self.navigationItem.rightBarButtonItems!{
            item.tintColor = UIColor(netHex: 0x515151)
        }
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(netHex: 0x515151)
        
        self.cgView.displayOptions = StrokeViewDisplayOptions.allCases[0]
        
        //默认打开打字工具
        textModeButton.isSelected = true
        
        //默认打字模式
        textMode(sender: nil)
    }
    
    @objc func buttonSelected(sender: UIButton!) {
        
        //将选中的按钮高亮
        sender.isSelected = true
        
        //取消其他按钮的高亮
        for button in self.containerStackView.arrangedSubviews{
            if let aButton = button as? UIButton {
                if aButton != sender {
                    aButton.isSelected = false
                }
            }
        }
        
    }
    
    //打字模式
    @objc func textMode(sender: UIButton?){
        
        //显示
        self.canvasContainerView.isHidden = true
        self.tableView.isHidden = false
        self.rouletteView.isHidden = false
        self.scrollView.isHidden = true
    }
    
    //TODO: 手写模式
    @objc func pencilMode_(sender: UIButton?){
        
        self.cgView.displayOptions = StrokeViewDisplayOptions.allCases[0]
        
        //清空手写层历史数据
        self.strokeCollection = StrokeCollection()
        cgView.strokeCollection = self.strokeCollection
        
        //显示
        self.canvasContainerView.isHidden = false
        self.tableView.isHidden = true
        self.rouletteView.isHidden = true
        self.scrollView.isHidden = false
        
    }
    
    //手绘板
    func setupDrawingBoard(){
        
    //手绘板
     
     let screenBounds = UIScreen.main.bounds
     let maxScreenDimension = max(screenBounds.width, screenBounds.height)
     
     let cgView = StrokeCGView(frame: CGRect(origin: .zero, size: CGSize(width: maxScreenDimension, height: maxScreenDimension)))
     cgView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
     self.cgView = cgView
     
     let bgImage = UIImage(named: "SingleLineBg")
     let bgImageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: maxScreenDimension, height: maxScreenDimension)))
     bgImageView.image = bgImage
     
     //canvasContainerView指白纸
     let canvasContainerView = CanvasContainerView(canvasSize: cgView.frame.size, imageView: bgImageView)
     canvasContainerView.documentView = cgView
     self.canvasContainerView = canvasContainerView
     // canvasContainerView.addSubview(bgImageView)
     
     //scrollView为屏幕下方的可缩放的view
     scrollView.contentSize = canvasContainerView.frame.size
     scrollView.contentOffset = CGPoint(x: (canvasContainerView.frame.width - scrollView.bounds.width) / 2.0,
                                        y: (canvasContainerView.frame.height - scrollView.bounds.height) / 2.0)
     scrollView.addSubview(canvasContainerView)
     scrollView.backgroundColor = canvasContainerView.backgroundColor
     scrollView.maximumZoomScale = 2.0
     scrollView.minimumZoomScale = 0.5
     scrollView.panGestureRecognizer.allowedTouchTypes = [UITouch.TouchType.direct.rawValue as NSNumber]
     scrollView.pinchGestureRecognizer?.allowedTouchTypes = [UITouch.TouchType.direct.rawValue as NSNumber]
     scrollView.scrollsToTop = true
     // We put our UI elements on top of the scroll view, so we don't want any of the
     // delay or cancel machinery in place.
     scrollView.delaysContentTouches = false
     
     tableView.delegate = self
     tableView.dataSource = self
     tableView.estimatedRowHeight = 500
     
     //手指和pencil分别的recognizer
     //        self.fingerStrokeRecognizer = setupStrokeGestureRecognizer(isForPencil: false)
     self.pencilStrokeRecognizer = setupStrokeGestureRecognizer(isForPencil: true)
     
     if #available(iOS 12.1, *) {
         let pencilInteraction = UIPencilInteraction()
         pencilInteraction.delegate = self as? UIPencilInteractionDelegate
         view.addInteraction(pencilInteraction)
     }
        
//        let screenBounds = UIScreen.main.bounds
//        let maxScreenDimension = max(screenBounds.width, screenBounds.height)
//
//        let cgView = StrokeCGView(frame: CGRect(origin: .zero, size: CGSize(width: maxScreenDimension, height: maxScreenDimension)))
//        cgView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.cgView = cgView
//
//        //canvasContainerView指白纸
//        let canvasContainerView = CanvasContainerView(canvasSize: cgView.frame.size)
//        canvasContainerView.documentView = cgView
//        self.canvasContainerView = canvasContainerView
//        // canvasContainerView.addSubview(bgImageView)
//
//        //scrollView为屏幕下方的可缩放的view
//        scrollView.contentSize = canvasContainerView.frame.size
//        scrollView.contentOffset = CGPoint(x: (canvasContainerView.frame.width - scrollView.bounds.width) / 2.0,
//                                           y: (canvasContainerView.frame.height - scrollView.bounds.height) / 2.0)
//        scrollView.addSubview(canvasContainerView)
//        scrollView.backgroundColor = canvasContainerView.backgroundColor
//        scrollView.maximumZoomScale = 2.0
//        scrollView.minimumZoomScale = 0.5
//        scrollView.panGestureRecognizer.allowedTouchTypes = [UITouch.TouchType.direct.rawValue as NSNumber]
//        scrollView.pinchGestureRecognizer?.allowedTouchTypes = [UITouch.TouchType.direct.rawValue as NSNumber]
//        scrollView.scrollsToTop = true
//        // We put our UI elements on top of the scroll view, so we don't want any of the
//        // delay or cancel machinery in place.
//        scrollView.delaysContentTouches = false
    }

    
    @IBAction func OCRAction(_ sender: Any) {
        
        if tableView.isHidden{
            //截图并解析
            let image = UIImage(fromView: self.canvasContainerView)
            self.OCR.run(image: image!,completion: {
                (results:[[WordFromOutline]]?) in
                self.ocrHandle(results: results)
            })
        }else{
            //获取图片
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .savedPhotosAlbum
            
            //显示imagePickerController
            self.present(imagePickerController, animated: true, completion: nil)
        }
        
        ocr = true
        
    }
    
    //导入图片
    @objc func importFile(sender: UIButton!){
        
        //获取图片
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .savedPhotosAlbum
        
        //显示imagePickerController
        self.present(imagePickerController, animated: true, completion: nil)
        ocr = false
    }
    
    //TODO: 禁止所有编辑
    @objc func pencilOrTextDisable(sender: UIButton!){
        
        renewAll()
        
    }
    
    func renewAll(){
        
        //刷新tableView的内容
        let cell = tableView.cellForRow(at: IndexPath(row: selectedCellIndex!, section: 0))! as! TextCell
        let textView = cell.textView
        textView!.attributedText = models[selectedCellIndex!]
        
        //刷新Models内容
        WordModelManager.shared.wordModels = models
        
        //取出slideView
        let theSegue = WordModelManager.shared.slideViewController
        
        //重新生成当页helloWord
        if theSegue?.presentationModel != nil {
            parsePageNSAttributedString(tempateID: theSegue!.presentationModel!.selectedDesignerIndex, colorID: theSegue!.currentColorID, pageID: selectedCellIndex!)
        }
        
        print("^^^^^^^^^^^^^^^^",theSegue as Any)
        
        //将当页内容赋值给slideView
        if selectedCellIndex != nil, theSegue != nil {
            if selectedCellIndex! >= theSegue!.presentationModel!.pages.count {
                theSegue?.presentationModel?.pages.append(self.parser.myHelloword.HellowordData![selectedCellIndex!])
            } else {
                theSegue?.presentationModel?.pages[selectedCellIndex!] = self.parser.myHelloword.HellowordData![selectedCellIndex!]
            }
        }
        
        //刷新slideView
        theSegue?.refreshPageCollectionView()
        
    }
    
    //Magic：文件保存及转换
    @IBAction func magicAction(_ sender: Any) {
        
        //解析用户输入，默认使用0号模版和0号配色
        parseNSAttributedString(tempateID: 0, colorID: 0)
        
        //存入文件
        saveFile()
        
        //跳转到sildeViewController
        performSegue(withIdentifier: "OutlineToSlideViewSegue", sender: self)
        
    }
    
    //解析NSAttributedString并传给parser
    func parseNSAttributedString(tempateID: Int, colorID: Int){
        
        for index in 0..<models.count {
            parsePageNSAttributedString(tempateID: tempateID, colorID: colorID, pageID: index)
        }
        
    }
    
    //解析当页NSAttributedString并传给parser
    func parsePageNSAttributedString(tempateID: Int, colorID: Int, pageID: Int){
        
        let attributedText = models[pageID];
        
        //提取各数组中的文字并用换行符拆分
        let string = attributedText.string
        let subString = string.split(separator: "\n", omittingEmptySubsequences: true)
        
        //存入传输数组
        var word = [WordFromOutline]()
        var nearestFirstTitle : Int?
        var nearestSecondTitle : Int?
        
        //以换行符分割元素，判断类型并创建传输数组
        for (index,aSubString) in subString.enumerated() {
            
            //取出attributesDictionary
            let start = aSubString.startIndex.utf16Offset(in: "Swift 4")
            let end = aSubString.endIndex.utf16Offset(in: "Swift 4")
            let attributesDictionary = attributedText.attributedSubstring(from: NSRange(location: start, length: end-start)).attributes(at: 0, effectiveRange: nil)
            let font = attributesDictionary[.font] as? UIFont
            var kind : kind
            var parentID : Int?
            
            //根据字号判断一二三级
            switch font?.pointSize {
            case UIFont.preferredFont(forTextStyle: .largeTitle).pointSize:
                kind = .firsttitle
                nearestFirstTitle = index
                parentID = nil
            case UIFont.preferredFont(forTextStyle: .title2).pointSize:
                kind = .secondtitle
                nearestSecondTitle = index
                parentID = nearestFirstTitle
            case UIFont.preferredFont(forTextStyle: .body).pointSize:
                kind = .thirdtitle
                //如果三级标题前只有一级标题，则父节点为该一级标题
                if nearestSecondTitle == nil || ((nearestSecondTitle != nil) && (nearestFirstTitle != nil) && (nearestSecondTitle! < nearestFirstTitle!)) {
                    parentID = nearestFirstTitle
                }else{
                    parentID = nearestSecondTitle
                }
            default:
                kind = .thirdtitle
                parentID = nearestSecondTitle
            }
            
            //如果文字中含有图片，则覆盖之前的处理结果
            attributedText.enumerateAttributes(in: NSRange(location: start, length: end-start), options: [], using: { (data, range, _) in
                //找出富文本中的附件
                if let attachment = data[.attachment] as? NSTextAttachment {
                    //取出附件中的图片
                    let image = (attachment.image)!
                    kind = .image
                    parentID = nil
                    word.append(WordFromOutline(id: index, type: kind, content: image, parentid: parentID))
                }else{
                    word.append(WordFromOutline(id: index, type: kind, content: aSubString.description, parentid: parentID))
                }
            })
            
        }
        
        //若cell非空，则parse
        if word.count > 0 {
            
            var lastWord : WordFromOutline?
            lastWord = nil
            
            //除去因为中英夹杂而多生成的节点
            for index in 0...word.count {
                let tuple = removeUselessElement(index: index, word: word, lastWord: lastWord)
                word = tuple.1
                lastWord = tuple.0
            }
            
            self.parser.modifiedFromWord(id: pageID, information: word, templateid: tempateID, colorid: colorID)
        }
        
    }
    
    //用于除去多余节点的辅助函数
    private func removeUselessElement(index: Int, word: [WordFromOutline], lastWord: WordFromOutline?) -> (WordFromOutline?, [WordFromOutline]) {
        
        var newLastWord = lastWord
        var newWord = word
        
        if index < word.count {
            if newLastWord == nil {
                newLastWord = newWord[index]
            } else {
                if word[index].id != newLastWord!.id {
                    newLastWord = newWord[index]
                } else {
                    newWord.remove(at: index)
                    let tuple = removeUselessElement(index: index, word: newWord, lastWord: newLastWord)
                    newWord = tuple.1
                    newLastWord = tuple.0
                }
            }
        }
        
        return (newLastWord,newWord)
    }
        
    //将parser的结果传给slideViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let theSegue = (segue.destination as! SlideViewController)
        WordModelManager.shared.slideViewController = theSegue
        theSegue.pageViews = self.parser.myHelloword.HellowordData
        theSegue.slideViewDelegate = self
        
    }
    
    //保存文件
    func saveFile() {
        
//        document?.attributedStringArray = models
//        document?.updateChangeCount(.done)
        
        if let url = try? FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
            ).appendingPathComponent("NewUntitled.helloWord"){
            //存入url
            do{
                let data = try NSKeyedArchiver.archivedData(withRootObject: models as Any , requiringSecureCoding: true)
                try data.write(to: url)
                print("saved!!!!!")
            }catch let error{
                print("couldn't save \(error)")
            }
        }
    
    }
    
    //读取文件
    func readFile() {
        
        print("~~~~TEST OF FILEREADING~~")
        
        var url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        url?.appendPathComponent("Untitled.helloWord")

        var attributedStringArray = [NSAttributedString]()
        
        if let data = try? Data(contentsOf: url!) {
            if let attributeArray = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [NSAttributedString]?{
                if attributeArray != nil{
                    for oneAttribute in attributeArray!{
                        let attribute = NSMutableAttributedString(attributedString: oneAttribute)
                        //枚举出富文本中所有的内容
                        attribute.enumerateAttributes(in: NSRange(location: 0, length: attribute.length), options: [], using: { (data, range, _) in
                            //找出富文本中的附件
                            if let attachment = data[.attachment] as? NSTextAttachment {
                                //取出附件中的图片
                                let image = (attachment.image)!
                                //缩放
                                let scale = 500 / image.size.width
                                //设置大小
                                attachment.bounds = CGRect(x: 0, y: 0, width: image.size.width * scale, height: image.size.height * scale)
                                //替换富文本中的附件
                                attribute.replaceCharacters(in: range, with: NSAttributedString(attachment: attachment))
                            }
                        })
                        attributedStringArray.append(attribute)
                    }
                }
            }
        }
        
        print("读出文件!")
        
        //根据文件中attributedString的个数创建相对应的cell
        for (index,attributedString) in attributedStringArray.enumerated(){
            
            //若索引小于models的范围
            if index < models.count{
                print("Modifying CELL \(index)")
                models[index] = attributedString
                print("attributedString:\(attributedString)")
                //若索引大于textView的范围
            } else {
                print("CREATING CELL \(index)")
                //创建一个新model并附加到中
                let model = attributedString
                models.append(model)
                print("attributedString:\(attributedString)")
                
                //在tableView中插入新行
                tableView.beginUpdates()
                let indexPath:IndexPath = IndexPath(row:(index), section:0)
                tableView.insertRows(at: [indexPath], with: .left)
                tableView.endUpdates()
            }
            
        }
        
        //刷新Models内容
        WordModelManager.shared.wordModels = models
        
        //刷新textView高度
        updateCellHeight()
        
        //刷新cell内容
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        print("~~~~TEST OF FILEREADING~~")
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        saveFile()
//        dismiss(animated: true) {
//            self.document?.close(completionHandler: nil)
//        }
    }
    
    /// A helper method that creates stroke gesture recognizers.
    /// - Tag: setupStrokeGestureRecognizer
    func setupStrokeGestureRecognizer(isForPencil: Bool) -> StrokeGestureRecognizer {
        let recognizer = StrokeGestureRecognizer(target: self, action: #selector(strokeUpdated(_:)))
        recognizer.delegate = self
        recognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(recognizer)
        recognizer.coordinateSpaceView = cgView
        recognizer.isForPencil = isForPencil
        return recognizer
    }
    
    func receivedAllUpdatesForStroke(_ stroke: Stroke) {
        cgView.setNeedsDisplay(for: stroke)
        stroke.clearUpdateInfo()
    }
    
//    @IBAction func clearButtonAction(_ sender: AnyObject) {
//        self.strokeCollection = StrokeCollection()
//        cgView.strokeCollection = self.strokeCollection
//    }
    
    /// Handles the gesture for `StrokeGestureRecognizer`.
    /// - Tag: strokeUpdate
    @objc
    func strokeUpdated(_ strokeGesture: StrokeGestureRecognizer) {
        
        if strokeGesture === pencilStrokeRecognizer {
            lastSeenPencilInteraction = Date()
        }
        
        var stroke: Stroke?
        if strokeGesture.state != .cancelled {
            stroke = strokeGesture.stroke
            if strokeGesture.state == .began ||
                (strokeGesture.state == .ended && strokeCollection.activeStroke == nil) {
                strokeCollection.activeStroke = stroke
            }
        } else {
            strokeCollection.activeStroke = nil
        }
        
        if let stroke = stroke {
            if strokeGesture.state == .ended {
                if strokeGesture === pencilStrokeRecognizer {
                    // Make sure we get the final stroke update if needed.
                    stroke.receivedAllNeededUpdatesBlock = { [weak self] in
                        self?.receivedAllUpdatesForStroke(stroke)
                    }
                }
                strokeCollection.takeActiveStroke()
            }
        }
        
        cgView.strokeCollection = strokeCollection
    }
    
    // MARK: Pencil Recognition and UI Adjustments
    /*
     Since usage of the Apple Pencil can be very temporary, the best way to
     actually check for it being in use is to remember the last interaction.
     Also make sure to provide an escape hatch if you modify your UI for
     times when the pencil is in use vs. not.
     */
    
    // Timeout the pencil mode if no pencil has been seen for 5 minutes and the app is brought back in foreground.
    let pencilResetInterval = TimeInterval(60.0 * 5)
    
    var lastSeenPencilInteraction: Date? {
        didSet {
            if lastSeenPencilInteraction != nil && !pencilMode {
                pencilMode = true
            }
        }
    }
    
    func shouldTimeoutPencilMode() -> Bool {
        guard let lastSeenPencilInteraction = self.lastSeenPencilInteraction else { return true }
        return abs(lastSeenPencilInteraction.timeIntervalSinceNow) > self.pencilResetInterval
    }
    
    //初始化pencilUI
    private func setupPencilUI() {
        self.pencilMode = true
        
        self.willEnterForegroundNotification = NotificationCenter.default.addObserver(
            forName: UIApplication.willEnterForegroundNotification,
            object: UIApplication.shared,
            queue: nil) { [unowned self](_) in
                if self.pencilMode && self.shouldTimeoutPencilMode() {
                    //self.stopPencilButtonAction(nil)
                }
        }
    }
    
    var willEnterForegroundNotification: NSObjectProtocol?
    
    /// Toggles pencil mode for the app.
    /// - Tag: pencilMode
    var pencilMode = true
    
}

// MARK: - UIGestureRecognizerDelegate

extension OutlineViewController: UIGestureRecognizerDelegate {
    
    // Since our gesture recognizer is beginning immediately, we do the hit test ambiguation here
    // instead of adding failure requirements to the gesture for minimizing the delay
    // to the first action sent and therefore the first lines drawn.
    
    // We want the pencil to recognize simultaniously with all others.
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer === pencilStrokeRecognizer {
            //            return otherGestureRecognizer !== fingerStrokeRecognizer
        }
        
        return false
    }
    
}

extension OutlineViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //取出UIImage
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        if ocr!{
            self.OCR.run(image: image,completion: {
                (results:[[WordFromOutline]]?) in
                self.ocrHandle(results: results)
                let name = Notification.Name("finishOcrHandle")
                NotificationCenter.default.post(name: name, object: nil)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }else{
            insertImage(image: image)
        }
        
        //关闭窗口
        picker.dismiss(animated: true, completion: nil)
    }
    
    func ocrHandle(results: [[WordFromOutline]]?){
        
        var  model = NSMutableAttributedString()
        
        if results != nil{
            for page in results!{
                model = NSMutableAttributedString()
                for element in page{
                    var type = String()
                    switch element.type {
                    case .firsttitle:
                        type = "cvm.FirstClass"
                    case .secondtitle:
                        type = "cvm.SecondClass"
                    case .thirdtitle:
                        type = "cvm.ThirdClass"
                    default:
                        type = "cvm.ThirdClass"
                    }
                    print(type)
                    print(element.content as! String)
                    model.append(NSAttributedString(string: (element.content as! String) + "\n", attributes: getWritingAttributes(name: type)))
                }
                
                if models[selectedCellIndex!].string == "" {
                    models.insert(model, at: selectedCellIndex!)
                } else {
                    models.insert(model, at: selectedCellIndex!+1)
                }
                
                selectedCellIndex! += 1
            }
            
            print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
            print(models)
            for (index,model) in models.enumerated() {
                print("第\(index)个page")
                print(model)
            }
            print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        }
        
        //刷新Models内容
        WordModelManager.shared.wordModels = models
        
        //刷新cell内容
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func insertImage(image: UIImage){
        //添加到TextView中
        //找到正在编辑的model
        let attributedText = models[selectedCellIndex!]
        
        //将图片作为附件
        let attributedString = NSMutableAttributedString(attributedString: attributedText)
        let textAttachment = NSTextAttachment()
        textAttachment.image = image
        
        //调整图片的大小
        let scale = 500 / image.size.width
        textAttachment.bounds = CGRect(x: 0, y: 0, width: scale * image.size.width, height: scale * image.size.height)
        let attrStringWithImage = NSAttributedString(attachment: textAttachment)
        
        //在图片前插入换行符（可选）
        let string = attributedText.string
        let subString = string.split(separator: "\n", omittingEmptySubsequences: true)
        if subString.last?.description != ""{
            attributedString.append(NSAttributedString(string: "\n", attributes: getWritingAttributes(name: lastModeName)))
        }
        attributedString.append(attrStringWithImage)
        attributedString.append(NSAttributedString(string: "\n", attributes:         getWritingAttributes(name: lastModeName)))
        
        //插入到正在编辑的model中
        models[selectedCellIndex!] = attributedString
        
        //刷新Models内容
        WordModelManager.shared.wordModels = models
        
        //保存文件
        saveFile()
        
        //刷新textView内容
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        //刷新textView高度
        updateCellHeight()
        
    }
    
    //感知RouletteView中心变化的函数
    func createObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(notification:)), name: Notification.Name("cvm.FirstClass"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(notification:)), name: Notification.Name("cvm.SecondClass"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(notification:)), name: Notification.Name("cvm.Passage"), object: nil)
    }
    
    public func postNotificationName(aName: String, object anObject: AnyObject?, userInfo aUserInfo: [NSObject : AnyObject]?){}
    
    @objc func handleNotification(notification: NSNotification){
        
        //避免重复设定
        let name = notification.name.rawValue
        if name == lastModeName{
            return
        }
        
        //更换即将输入的文字格式
        lastModeName = name
    }
    
    func getWritingAttributes(name: String)->[NSAttributedString.Key : Any]{
        var key : [NSAttributedString.Key : Any]
        switch name {
        case "cvm.FirstClass":
            key = [NSAttributedString.Key.foregroundColor : UIColor(netHex: 0x212F3C) ,NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle), NSAttributedString.Key.baselineOffset : 10]
        case "cvm.SecondClass":
            key = [NSAttributedString.Key.foregroundColor : UIColor(netHex: 0x1C2833),NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title2), NSAttributedString.Key.baselineOffset : 10]
        case "cvm.Passage":
            key = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body), NSAttributedString.Key.baselineOffset : 2]
        default:
            key = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body), NSAttributedString.Key.baselineOffset : 2]
        }
        return key
    }
    
}

extension OutlineViewController : SlideViewDelegate {
    
    func getNewPages(templateID: Int, colorID: Int) -> [Page]? {
        
        //解析用户输入，更换模版
        parseNSAttributedString(tempateID: templateID, colorID: colorID)
        
        print(self.parser.myHelloword.HellowordData?.count as Any)
        print(self.parser.myWord.WordData.count)
        
        return self.parser.myHelloword.HellowordData
    }

}

extension OutlineViewController : WordModelManagerDelegete {
    
    func setSelectedIndex(globalSelectedIndex: Int?) {
        self.selectedCellIndex = globalSelectedIndex
    }
    
    func setModel(globalModel: [NSAttributedString]) {
        
        //设置model的内容
        self.models = globalModel
//        self.tableView.reloadData()
        
        //刷新tableView的内容
        if selectedCellIndex != nil, tableView.cellForRow(at: IndexPath(row: selectedCellIndex!, section: 0)) != nil {
            let cell = tableView.cellForRow(at: IndexPath(row: selectedCellIndex!, section: 0))! as! TextCell
            let textView = cell.textView
            if selectedCellIndex! < models.count{
                textView!.attributedText = models[selectedCellIndex!]
            }
        }
        
    }
    
}
