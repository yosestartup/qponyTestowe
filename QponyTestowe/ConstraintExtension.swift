//
//  ConstraintExtension.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 11/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    
    func withRatio() -> CGFloat {
        return self * (UIScreen.main.bounds.width / 375)
    }
    
}

extension Double {
    
    func withRatio() -> CGFloat {
        return CGFloat(self) * (UIScreen.main.bounds.width / 375)
    }
    
}

extension Int {
    
    func withRatio() -> CGFloat {
        return CGFloat(self) * (UIScreen.main.bounds.width / 375)
    }
    
}

