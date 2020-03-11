//
//  ColorManager.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 11/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation
import UIKit

class ColorManager {
    static var lightGrey: UIColor {
        return UIColor.RGB(r: 120, g: 120, b: 120)
    }
    
    static var darkBlue: UIColor {
        return UIColor.RGB(r: 34, g: 53, b: 80)
    }
}

extension UIColor {
    static func RGB(r: (Int), g: (Int), b: (Int), a: (CGFloat) = 1) -> UIColor {
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }
}

