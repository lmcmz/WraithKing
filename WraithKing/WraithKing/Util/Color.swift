//
//  Color.swift
//  WraithKing
//
//  Created by lmcmz on 23/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    convenience init?(hex: String) {
        var hexCode: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (hexCode.hasPrefix("#")) {
            hexCode.remove(at: hexCode.startIndex)
        }
        
        if(hexCode.count != 6) {
            return nil
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: hexCode).scanHexInt32(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: CGFloat(1.0))
    }
}
