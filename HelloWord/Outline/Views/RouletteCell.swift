//
//  Cell.swift
//  RewardViewDemo
//
//  Created by SandyHu on 2019/9/23.
//  Copyright © 2019 cuixuerui. All rights reserved.
//

import Foundation

struct RouletteCell: Codable {
    
    let title : String
    let image : String
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
}
