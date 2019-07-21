//
//  ColorUtils.swift
//  redgames
//
//  Created by Raphael Ramos on 25/05/19.
//  Copyright © 2019 Powell Apps. All rights reserved.
//

import Foundation
import UIKit

class ColorUtils {
    
    static func primary() -> UIColor {
        return green()
    }
    
    static func red() -> UIColor {
        return hexStringToUIColor(hex: "#e35418")
    }
    
    static func blue() -> UIColor {
        return hexStringToUIColor(hex: "#0058a0")
    }
    
    static func accent() -> UIColor {
        return blue()
    }
    
    static func green() -> UIColor {
        return hexStringToUIColor(hex: "#008636")
    }
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
