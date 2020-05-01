//
//  LinkTextView.swift
//  HelloWord
//
//  Created by SandyHu on 2019/10/14.
//  Copyright © 2019 HelloWord. All rights reserved.
//

import UIKit

protocol LinkTextDelegate {
    func didTouched()
}

class LinkTextView: UITextView {
    
    var linkTextdelegate: LinkTextDelegate?
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        isScrollEnabled = false
        isEditable = true
        isUserInteractionEnabled = false
        isSelectable = true
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        linkTextdelegate?.didTouched()
//        isUserInteractionEnabled = true
//    }
    
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        // Get the character index from the tap location
//        let characterIndex = layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
//
//        // if we detect a link, handle the tap by returning self...
//        if let _ = textStorage.attribute(NSAttributedString.Key.link, at: characterIndex, effectiveRange: nil) {
//            return self
//        }
//
//        // ... otherwise return nil ; the tap will go on to the next receiver
//        return nil
//    }
    
}
