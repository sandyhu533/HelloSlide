//
//  TextCell.swift
//  HelloWord
//
//  Created by SandyHu on 2019/10/11.
//  Copyright © 2019 HelloWord. All rights reserved.
//

import UIKit

protocol TextCellDelegate {
    func didSecetedSelf(cell: TextCell)
    func didDeleteCell()
    func didAddCell()
}

class TextCell: UITableViewCell, UITextViewDelegate {
    

    @IBOutlet weak var textView: LinkTextView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var delegate: TextCellDelegate?
    
    @IBAction func didAddCell(_ sender: Any) {
        delegate?.didAddCell()
    }
    
    @IBAction func didDeleteCell(_ sender: Any) {
        delegate?.didDeleteCell()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.didSecetedSelf(cell: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.delegate = self
        createObserversOfRouletteView()
        updateWritingMode(name: lastModeName)
//        let tapGestureRecognizer = UITapGestureRecognizer(target: textView, action: #selector(tap(sender:)))
//        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
//    @objc func tap(sender: UITapGestureRecognizer) {
//        self.isPicked = true
//        self.textView.isUserInteractionEnabled = true
//    }
//
//    func didTouched() {
//        self.isPicked = true
//    }
    
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//
////        // ... otherwise return nil ; the tap will go on to the next receiver
//        self.isPicked = true
//////        self.setEditing(true, animated: true)
//        return self
//    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        let name = Notification.Name("textViewDidBeginEditing")
        NotificationCenter.default.post(name: name, object: nil)
        updateWritingMode(name: lastModeName)
    }
    
    public func postNotificationName(aName: String, object anObject: AnyObject?, userInfo aUserInfo: [NSObject : AnyObject]?){}
    
    //感知RouletteView中心变化的函数
    func createObserversOfRouletteView(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(notification:)), name: Notification.Name("cvm.FirstClass"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(notification:)), name: Notification.Name("cvm.SecondClass"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(notification:)), name: Notification.Name("cvm.Passage"), object: nil)
    }
    
    var lastModeName = String("cvm.FirstClass")
    
    @objc func handleNotification(notification: NSNotification){
        
        //避免重复设定
        let name = notification.name.rawValue
        if name == lastModeName{
            return
        }
        
        //更换即将输入的文字格式
        lastModeName = name
        updateWritingMode(name: lastModeName)
    }
    
    func updateWritingMode(name: String){
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
        
        if self.isPicked == true{
            addNextLineCharacter()
        }
    }
    
    func addNextLineCharacter(){
        let string = textView.attributedText.string
        let subString = string.split(separator: "\n", omittingEmptySubsequences: true)
        if subString.last?.description != ""{
            let newText = NSMutableAttributedString(attributedString: textView.attributedText)
            newText.append(NSAttributedString(string: "\n", attributes: textView.typingAttributes))
            textView.attributedText = newText
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    var isPicked = false{
        didSet{
            if isPicked == true{
                deleteButton.isHidden = false
                addButton.isHidden = false
                self.textView.isUserInteractionEnabled = true
                self.contentView.backgroundColor = UIColor(netHex: 0xf2fbff)
            }else{
                deleteButton.isHidden = true
                addButton.isHidden = true
                self.textView.isUserInteractionEnabled = false
                self.contentView.backgroundColor = UIColor.white
            }
        }
    }
}
