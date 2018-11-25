//
//  Util.swift
//  WraithKing
//
//  Created by lmcmz on 23/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import Foundation
import UIKit

// MARK:  - Class

class Constants {
    static let SCREEN_WIDTH : CGFloat = UIScreen.main.bounds.width
    static let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    static let padding : CGFloat = 12
    
    static let supportCurrency = 32 as Int
    static let NavigationBarHeightX = 44
    static let BottomBarHeightX = 34
    
    static let HomePageVCHeight = UIScreen.main.bounds.height - 50 - 44 - 34
    
    //    static let isPhoneSE:Bool = UIScreen.main.bounds.height ==
    
    class func isIPhone5() -> Bool{
        return Constants.SCREEN_WIDTH == 320
    }
    
    class func isIPad() -> Bool{
        return Constants.SCREEN_HEIGHT > 812
    }
}

// MARK:  - Extension

// MARK: NSObject

public extension NSObject{
    public class var nameOfClass: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public var nameOfClass: String{
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}

// MARK: String

extension String {
    func readDateFromString(formatter: String) -> Date {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = formatter
        let date: Date? = dateFormatterGet.date(from: self)! as Date
        return date! as Date
    }
}

// MARK: Date

extension Date {
    public func printDateFromDate(formatter: String) -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = formatter
        dateFormatterPrint.timeZone = NSTimeZone.local
        return dateFormatterPrint.string(from: self)
    }
}

// MARK: Color

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
