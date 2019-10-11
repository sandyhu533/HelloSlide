//
//  UIViewControllerExtension.swift
//  HelloWord
//
//  Created by SandyHu on 2019/10/10.
//  Copyright © 2019 HelloWord. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    var contents: UIViewController {
        if let navon = self as? UINavigationController {
            return navon.visibleViewController ?? navon
        } else {
            return self
        }
    }
}
