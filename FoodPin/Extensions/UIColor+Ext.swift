//
//  UIColor+Ext.swift
//  FoodPin
//
//  Created by Ly Gia Huy on 22/03/2023.
//

import UIKit


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
}
