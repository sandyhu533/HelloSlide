/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The primary view controller.
 */

import UIKit

class OutlineViewController: UIViewController, RouletteViewDelegate {
    
    var parser: Parser!
    
    var cgView: StrokeCGView!
    var pencilStrokeRecognizer: StrokeGestureRecognizer!

    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var canvasView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var strokeCollection = StrokeCollection()
    var canvasContainerView: CanvasContainerView!
    
    /// Prepare the drawing canvas.
    /// - Tag: CanvasMainViewController-viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //解析器
        self.parser = Parser()
        parser.bounds = self.view.bounds
        
        //cgView是手写的图层，大小与canvasView一致
        self.cgView = StrokeCGView(frame: canvasView.frame)
        self.cgView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                
        //cgView是文字的图层，大小比canvasView稍小
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 500
        
        canvasView.addSubview(cgView)
        canvasView.backgroundColor = .blue
        
        //手指和pencil分别的recognizer
        //        self.fingerStrokeRecognizer = setupStrokeGestureRecognizer(isForPencil: false)
        self.pencilStrokeRecognizer = setupStrokeGestureRecognizer(isForPencil: true)
        
        if #available(iOS 12.1, *) {
            let pencilInteraction = UIPencilInteraction()
            pencilInteraction.delegate = self as? UIPencilInteractionDelegate
            view.addInteraction(pencilInteraction)
        }
        
//        NotificationCenter.default.addObserver(self, selector: Selector(("receiverNotification")), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        //监听rouletteView
        createObserversOfRouletteView()
        setupDrawingToolBar()
        setupPencilUI()
        setupRouletteBar()
    }
    
    //编辑模式
    @IBAction func editMode(_ sender: Any) {
        //清空、隐藏手写层
        self.strokeCollection = StrokeCollection()
        cgView.strokeCollection = self.strokeCollection
        cgView.isHidden = true
        //关闭手写层所有button的高亮
        for button in self.containerStackView .arrangedSubviews{
            if let button = button as? UIButton {
                button.isSelected = false
            }
        }
        //打开编辑层
        for cell in tableView.visibleCells{
            let textView = cell.contentView.subviews[0] as? UITextView
            textView?.isEditable = true
        }
        //默认输入格式为一级标题格式
        for cell in tableView.visibleCells{
            let textView = cell.contentView.subviews[0] as! UITextView
            textView.typingAttributes = [NSAttributedString.Key.foregroundColor : UIColor(netHex: 0x212F3C) ,NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle), NSAttributedString.Key.baselineOffset : 10]
        }
    }
    
    func setupRouletteBar(){
        let rouletteCells = [
                             RouletteCell(title: "Passage", image: "Passage"),
                             RouletteCell(title: "FirstClass", image: "FirstClass"),
                             RouletteCell(title: "SecondClass", image: "SecondClass"),
                             RouletteCell(title: "Passage", image: "Passage"),
                             RouletteCell(title: "FirstClass", image: "FirstClass"),
                             RouletteCell(title: "SecondClass", image: "SecondClass"),]
        
        let rouletteView = RouletteView()
        view.addSubview(rouletteView)
        //rouletteView.frame = CGRect(x: 0.0, y: self.view.center.y, width: 300, height: 350)
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
    
    func setupDrawingToolBar(){
        
        self.containerStackView.spacing = 5
        
        let writeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        writeButton.setImage(UIImage(named: "Write"), for: .normal)
        writeButton.imageView?.contentMode = .scaleAspectFit
        writeButton.setBackgroundImage(UIImage(named: "Bg"), for: .selected)
        writeButton.addTarget(self, action: #selector(buttonSelected), for: .allTouchEvents)
        let width1 = NSLayoutConstraint(item: writeButton, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        writeButton.addConstraint(width1)
        self.containerStackView.addArrangedSubview(writeButton)
        
        let highlightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        highlightButton.setImage(UIImage(named: "Highlight"), for: .normal)
        highlightButton.imageView?.contentMode = .scaleAspectFit
        highlightButton.setBackgroundImage(UIImage(named: "Bg"), for: .selected)
        highlightButton.addTarget(self, action: #selector(buttonSelected), for: .allTouchEvents)
        let width2 = NSLayoutConstraint(item: highlightButton, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        highlightButton.addConstraint(width2)
        self.containerStackView.addArrangedSubview(highlightButton)
        
        let eraserButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        eraserButton.setImage(UIImage(named: "Eraser"), for: .normal)
        eraserButton.imageView?.contentMode = .scaleAspectFit
        eraserButton.setBackgroundImage(UIImage(named: "Bg"), for: .selected)
        eraserButton.addTarget(self, action: #selector(buttonSelected), for: .allTouchEvents)
        let width3 = NSLayoutConstraint(item: eraserButton, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        eraserButton.addConstraint(width3)
        self.containerStackView.addArrangedSubview(eraserButton)
        
        let tailorButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        tailorButton.setImage(UIImage(named: "Tailor"), for: .normal)
        tailorButton.imageView?.contentMode = .scaleAspectFit
        tailorButton.setBackgroundImage(UIImage(named: "Bg"), for: .selected)
        tailorButton.addTarget(self, action: #selector(buttonSelected), for: .allTouchEvents)
        let width4 = NSLayoutConstraint(item: tailorButton, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        tailorButton.addConstraint(width4)
        self.containerStackView.addArrangedSubview(tailorButton)
        
        let pencilDisableButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        pencilDisableButton.setImage(UIImage(named: "PencilDisable"), for: .normal)
        pencilDisableButton.imageView?.contentMode = .scaleAspectFit
        pencilDisableButton.setBackgroundImage(UIImage(named: "Bg"), for: .selected)
        pencilDisableButton.addTarget(self, action: #selector(buttonSelected), for: .allTouchEvents)
        let width5 = NSLayoutConstraint(item: pencilDisableButton, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        pencilDisableButton.addConstraint(width5)
        self.containerStackView.addArrangedSubview(pencilDisableButton)
        
        self.navigationItem.titleView = self.containerStackView
        
        self.cgView.displayOptions = StrokeViewDisplayOptions.allCases[0]
        //默认打开手写工具
        writeButton.isSelected = true
        //默认手写模式
        drawMode()
    }
    
    @objc func buttonSelected(sender: UIButton!) {
        //切换按钮形态
        sender.isSelected = true
        //切换手写工具
        for (index,button) in self.containerStackView .arrangedSubviews.enumerated(){
            if let aButton = button as? UIButton {
                if aButton != sender {
                    aButton.isSelected = false
                }else{
                    self.cgView.displayOptions = StrokeViewDisplayOptions.allCases[index]
                }
            }
        }
        //关闭编辑层，打开手写层
        drawMode()
    }
    
    //手写模式
    func drawMode(){
        //关闭编辑层
        for cell in tableView.visibleCells{
            let textView = cell.contentView.subviews[0] as? UITextView
            textView?.isEditable = false
        }
        //打开手写层
        cgView.isHidden = false
        //清空手写层历史数据
        self.strokeCollection = StrokeCollection()
        cgView.strokeCollection = self.strokeCollection
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    /// A helper method that creates stroke gesture recognizers.
    /// - Tag: setupStrokeGestureRecognizer
    func setupStrokeGestureRecognizer(isForPencil: Bool) -> StrokeGestureRecognizer {
        let recognizer = StrokeGestureRecognizer(target: self, action: #selector(strokeUpdated(_:)))
        recognizer.delegate = self
        recognizer.cancelsTouchesInView = false
        recognizer.coordinateSpaceView = cgView
        recognizer.isForPencil = isForPencil
        return recognizer
    }
    
    func receivedAllUpdatesForStroke(_ stroke: Stroke) {
        cgView.setNeedsDisplay(for: stroke)
        stroke.clearUpdateInfo()
    }
    
    @IBAction func magicButtonAction(_ sender: AnyObject) {
//        self.strokeCollection = StrokeCollection()
//        cgView.strokeCollection = self.strokeCollection
        for (index,cell) in tableView.visibleCells.enumerated(){
            //提取各数组中的文字并用换行符拆分
            let textView = cell.contentView.subviews[0] as! UITextView
            let attributedText = textView.attributedText!
            let string = attributedText.string
            let subString = string.split(separator: "\n", omittingEmptySubsequences: true)
            
            //存入传输数组
            var word = [wordFromOutline]()
            var nearestFirstTitle : Int?
            var nearestSecondTitle : Int?
            for (index,aSubString) in subString.enumerated() {
                let start = (aSubString.startIndex.utf16Offset(in: "Swift 5"))
                let end = aSubString.endIndex.utf16Offset(in: "Swift 5")
                let attributesDictionary = attributedText.attributedSubstring(from: NSRange(location: start, length: end-start)).attributes(at: 0, effectiveRange: nil)
                let font = attributesDictionary[.font] as! UIFont
                let kind : kind
                var parentID : Int?
                switch font.pointSize {
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
                    parentID = nearestSecondTitle
                default:
                    kind = .thirdtitle
                    parentID = nearestSecondTitle
                }
                word.append(wordFromOutline(id: index, type: kind, content: aSubString.description, parentid: parentID))
            }
            //若cell非空，则parse
            if word.count > 0 {
                self.parser.modifiedFromWord(id: index, information: word)
            }
        }
        performSegue(withIdentifier: "OutlineToSlideViewSegue", sender: self)
        //debug
//        self.view = self.parser.myHelloword.HellowordData[1]
//        self.view = self.parser.myHelloword.HellowordData[0].PageCellElments[0]
//        self.view.layoutSubviews()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let theSegue = segue.destination as! SlideViewController
        theSegue.pageViews = self.parser.myHelloword.HellowordData
    }
    
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
    
    //感知RouletteView中心变化的函数
    func createObserversOfRouletteView(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateWritingMode(notification:)), name: Notification.Name("cvm.FirstClass"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateWritingMode(notification:)), name: Notification.Name("cvm.SecondClass"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateWritingMode(notification:)), name: Notification.Name("cvm.Passage"), object: nil)
    }

    var lastModeName : String?

    @objc func updateWritingMode(notification: NSNotification){
        //避免重复设定
        let name = notification.name.rawValue
        if name == lastModeName{
            return
        }
        
        for cell in tableView.visibleCells{
            let textView = cell.contentView.subviews[0] as! UITextView
            //更换即将输入的文字格式
            lastModeName = name
            switch name {
            case "cvm.FirstClass":
                textView.typingAttributes = [NSAttributedString.Key.foregroundColor : UIColor(netHex: 0x212F3C) ,NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle), NSAttributedString.Key.baselineOffset : 10]
            case "cvm.SecondClass":
                textView.typingAttributes = [NSAttributedString.Key.foregroundColor : UIColor(netHex: 0x1C2833),NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title2), NSAttributedString.Key.baselineOffset : 10]
            case "cvm.Passage":
                textView.typingAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body), NSAttributedString.Key.baselineOffset : 2]
            default:
                textView.typingAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body), NSAttributedString.Key.baselineOffset : 2]
            }
        }
        
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
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
                return true
        }
        return false
    }
}
