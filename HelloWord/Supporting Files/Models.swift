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

struct WordModelManager {
    
    static var shared = WordModelManager(wordModels: [NSAttributedString]())
    
    static var wordModelManagerDelegete : WordModelManagerDelegete?
    
    var wordModels: [NSAttributedString] {
        didSet{
            WordModelManager.wordModelManagerDelegete?.setModel(globalModel: wordModels)
            
        }
    }
}

protocol WordModelManagerDelegete {
    func setModel( globalModel : [NSAttributedString] )
}
