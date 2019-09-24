/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The primary view controller.
 */

import UIKit

class CanvasMainViewController: UIViewController, RouletteViewDelegate {
    
    var cgView: StrokeCGView!
    var textView: UITextView!
    
    //    var fingerStrokeRecognizer: StrokeGestureRecognizer!
    var pencilStrokeRecognizer: StrokeGestureRecognizer!

    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet var scrollView: UIScrollView!
    
    var strokeCollection = StrokeCollection()
    var canvasContainerView: CanvasContainerView!
    
    /// Prepare the drawing canvas.
    /// - Tag: CanvasMainViewController-viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let screenBounds = UIScreen.main.bounds
//        let maxScreenDimension = max(screenBounds.width, screenBounds.height)
        
        //cgView是手写的图层，大小与scrollView一致
        self.cgView = StrokeCGView(frame: CGRect(origin: .zero, size: CGSize(width: min(self.scrollView.frame.width,self.scrollView.frame.height), height: max(self.scrollView.frame.width,self.scrollView.frame.height) )))
        self.cgView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        print("cgView",cgView.frame.size)
        print("scrollView",scrollView.frame.size)
        
        //cgView是手写的图层，大小与scrollView一致
        self.textView = UITextView(frame: CGRect(x: 0.05 * cgView.frame.width, y: 0.05 * cgView.frame.height, width: 0.9 * cgView.frame.width, height: 0.9 * cgView.frame.height))
        self.textView.text = "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
        self.textView.backgroundColor = .blue
        
        //默认手写模式，隐藏编辑模式文字层
        //textView.isHidden = true
        
        //canvasContainerView是scrollView的content，是cgView的containner
        let canvasContainerView = CanvasContainerView(canvasSize: cgView.frame.size, scrollSize:
            scrollView.frame.size)
        canvasContainerView.cgView = cgView
        canvasContainerView.textView = textView
        canvasContainerView.backgroundColor = .lightGray
        self.canvasContainerView = canvasContainerView
        
        print("canvasContainerView",canvasContainerView.frame.size)
        
        //scrollView最大的ViewContainer，位于底层，它有一个subView：canvasContainerView
        scrollView.contentSize = canvasContainerView.frame.size
        scrollView.addSubview(canvasContainerView)
        scrollView.backgroundColor = canvasContainerView.backgroundColor
        scrollView.maximumZoomScale = 1
        scrollView.minimumZoomScale = 1
        scrollView.panGestureRecognizer.allowedTouchTypes = [UITouch.TouchType.direct.rawValue as NSNumber]
        scrollView.pinchGestureRecognizer?.allowedTouchTypes = [UITouch.TouchType.direct.rawValue as NSNumber]
        // We put our UI elements on top of the scroll view, so we don't want any of the
        // delay or cancel machinery in place.
        scrollView.delaysContentTouches = false
        
        //手指和pencil分别的recognizer
        //        self.fingerStrokeRecognizer = setupStrokeGestureRecognizer(isForPencil: false)
        self.pencilStrokeRecognizer = setupStrokeGestureRecognizer(isForPencil: true)
        
        if #available(iOS 12.1, *) {
            let pencilInteraction = UIPencilInteraction()
            pencilInteraction.delegate = self as? UIPencilInteractionDelegate
            view.addInteraction(pencilInteraction)
        }
        
        setupDrawingToolBar()
        setupPencilUI()
        setupRouletteBar()
    }
    
    //编辑模式
    @IBAction func editMode(_ sender: Any) {
        //隐藏手写层，打开编辑层
        self.canvasContainerView.cgView?.isHidden = true
        //self.textView.isHidden = false
    }
    
    
    func setupRouletteBar(){
        let rouletteCells = [RouletteCell(title: "NextPage", image: "NextPage"),
                             RouletteCell(title: "Camera", image: "Camera"),
                             RouletteCell(title: "FirstClass", image: "FirstClass"),
                             RouletteCell(title: "SecondClass", image: "SecondClass"),
                             RouletteCell(title: "Passage", image: "Passage"),
                             RouletteCell(title: "NextPage", image: "NextPage"),
                             RouletteCell(title: "Camera", image: "Camera"),
                             RouletteCell(title: "FirstClass", image: "FirstClass"),
                             RouletteCell(title: "SecondClass", image: "SecondClass"),
                             RouletteCell(title: "Passage", image: "Passage"),]
        
        let rouletteView = RouletteView()
        view.addSubview(rouletteView)
        //rouletteView.frame = CGRect(x: 0.0, y: self.view.center.y, width: 300, height: 350)
        rouletteView.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(350)
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
        writeButton.isSelected = true
    }
    
    //手写模式
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
        //打开手写层，隐藏编辑层
        self.canvasContainerView.cgView?.isHidden = false
        //self.textView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.flashScrollIndicators()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    /// A helper method that creates stroke gesture recognizers.
    /// - Tag: setupStrokeGestureRecognizer
    func setupStrokeGestureRecognizer(isForPencil: Bool) -> StrokeGestureRecognizer {
        let recognizer = StrokeGestureRecognizer(target: self, action: #selector(strokeUpdated(_:)))
        recognizer.delegate = self
        recognizer.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(recognizer)
        recognizer.coordinateSpaceView = cgView
        recognizer.isForPencil = isForPencil
        return recognizer
    }
    
    func receivedAllUpdatesForStroke(_ stroke: Stroke) {
        cgView.setNeedsDisplay(for: stroke)
        stroke.clearUpdateInfo()
    }
    
    @IBAction func clearButtonAction(_ sender: AnyObject) {
        self.strokeCollection = StrokeCollection()
        cgView.strokeCollection = self.strokeCollection
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
    
}

// MARK: - UIGestureRecognizerDelegate

extension CanvasMainViewController: UIGestureRecognizerDelegate {
    
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

// MARK: - UIScrollViewDelegate

extension CanvasMainViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.canvasContainerView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        var desiredScale = self.traitCollection.displayScale
        let existingScale = cgView.contentScaleFactor
        
        if scale >= 2.0 {
            desiredScale *= 2.0
        }
        
        if abs(desiredScale - existingScale) > 0.000_01 {
            cgView.contentScaleFactor = desiredScale
            cgView.setNeedsDisplay()
        }
    }
}
