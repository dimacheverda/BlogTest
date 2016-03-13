//
//  Appearance.swift
//  BlogTest
//
//  Created by Dima Cheverda on 3/13/16.
//  Copyright © 2016 Dima Cheverda. All rights reserved.
//

import UIKit

class Appearance {
    class func setupAppearance() {
        let barTintColor = UIColor(red:0.09, green:0.09, blue:0.11, alpha:1)  // Yalantis gray color
        let tintColor = UIColor(red:1, green:0.39, blue:0, alpha:1)  // Yalantis orange color
        
        UINavigationBar.appearance().tintColor = tintColor
        UINavigationBar.appearance().barTintColor = barTintColor
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: tintColor]
        UINavigationBar.appearance().barStyle = .Black
    }
}
