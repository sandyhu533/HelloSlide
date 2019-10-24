//
//  Models.swift
//  Gallery
//
//  Copyright © 2019 Apple, Inc. All rights reserved.
//

/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A file that defines our data models (Photo and PhotoSection).
*/

import UIKit

let HelloWordOpenDetailActivityType       = "com.HelloWord.openDetail"
let HelloWordOpenDetailPath               = "openDetail"
let HelloWordOpenDetailPhotoIdKey         = "HelloWordId"

public struct HelloWordModel {

    let pageViews: [Page]?

    var openDetailUserActivity: NSUserActivity {
        // Create an NSUserActivity from our photo model.
        // Note: The activityType string below must be included in your Info.plist file under the `NSUserActivityTypes` array.
        // More info: https://developer.apple.com/documentation/foundation/nsuseractivity
        let userActivity = NSUserActivity(activityType: HelloWordOpenDetailActivityType)
        userActivity.title = HelloWordOpenDetailPath
        userActivity.userInfo = [HelloWordOpenDetailPhotoIdKey: pageViews as Any]
        return userActivity
    }

}

class WordModelManager {
    
    static var shared = WordModelManager()
    
    static var wordModelManagerDelegete0 : WordModelManagerDelegete?
    static var wordModelManagerDelegete1 : WordModelManagerDelegete?
    
    var outlineViewController0 : OutlineViewController?
    var outlineViewController1 : OutlineViewController?
    
    var lock0 : Int = 0
    var lock1 : Int = 0
    
    var slideViewController : SlideViewController?
    
    var wordModels: [NSAttributedString] = [NSAttributedString]() {
        didSet {
            WordModelManager.wordModelManagerDelegete0?.setModel(globalModel: wordModels)
            WordModelManager.wordModelManagerDelegete1?.setModel(globalModel: wordModels)
//            if lock1 == 0 {
                outlineViewController0?.cellConsistentDelegate = outlineViewController1
                outlineViewController1?.cellConsistentDelegate = outlineViewController0
//                lock1 = 1
//            }
        }
    }
}

protocol WordModelManagerDelegete {
    func setModel( globalModel : [NSAttributedString] )
}
