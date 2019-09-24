/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The content of the scroll view. Adds some margin and a shadow. Setting the documentView places this view, and sizes it to the canvasSize.
 */

import UIKit

class CanvasContainerView: UIView {
    let canvasSize: CGSize
    
    //documentView的容器
    let canvasView: UIView
    
    var cgView: UIView? {
        willSet {
            if let previousView = cgView {
                previousView.removeFromSuperview()
            }
        }
        didSet {
            if let newView = cgView {
                newView.frame = canvasView.bounds
                canvasView.addSubview(newView)
            }
        }
    }
    
    var textView: UITextView?{
        didSet{
            if textView != nil{
                canvasView.addSubview(textView!)
            }
        }
    }
    
    var maxDimension:CGFloat
    var minDimension:CGFloat
    
    required init(canvasSize: CGSize, scrollSize: CGSize) {
        
        maxDimension = max(scrollSize.width, scrollSize.height)
        print("maxDimension",maxDimension)
        minDimension = min(scrollSize.width, scrollSize.height)
        self.canvasSize = canvasSize
        print("minDimension",minDimension)
        
        var size = canvasSize
        let orient = UIDevice.current.orientation
        if orient.isPortrait {
            //取canvasSize和scrollSize中的最大值
            size.width = max(minDimension, canvasSize.width)
            //取canvasSize.height和scrollSize.height中的最大值
            size.height = max(maxDimension, canvasSize.height)
        }else{
            size.width = max(maxDimension, canvasSize.width)
            size.height = max(minDimension, canvasSize.height)
        }
        
        let frame = CGRect(origin: .zero, size: size)
        
        print("frameOfCanvasContainerView",frame)
        
        let canvasOrigin = CGPoint(x: (frame.width - canvasSize.width) / 2.0, y: (frame.height - canvasSize.height) / 2.0)
        let canvasFrame = CGRect(origin: canvasOrigin, size: canvasSize)
    
        canvasView = UIView(frame: canvasFrame)
        canvasView.backgroundColor = UIColor.white
        canvasView.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        canvasView.layer.shadowRadius = 4.0
        canvasView.layer.shadowColor = UIColor.darkGray.cgColor
        canvasView.layer.shadowOpacity = 1.0
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(canvasView)
        NotificationCenter.default.addObserver(self, selector: Selector(("receiverNotification")), name: UIDevice.orientationDidChangeNotification, object: nil)
        print("CanvasContainerView",frame.size)
        print("CanvasView",canvasView.frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func receiverNotification(){
        adjustFrame()
    }
    
    func adjustFrame(){
        let orient = UIDevice.current.orientation
        var size = canvasSize
        if orient.isPortrait {
            size.width = max(minDimension, canvasSize.width)
            size.height = max(maxDimension, canvasSize.height)
        }else{
            size.width = max(maxDimension, canvasSize.width)
            size.height = max(minDimension, canvasSize.height)
        }
        self.frame = CGRect(origin: .zero, size: size)
        
        let canvasOrigin = CGPoint(x: (size.width - canvasSize.width) / 2.0, y: (size.height - canvasSize.height) / 2.0)
        self.canvasView.frame = CGRect(origin: canvasOrigin, size: canvasSize)
    }
}
