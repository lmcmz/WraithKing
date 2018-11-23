//
//  Util.swift
//  WraithKing
//
//  Created by lmcmz on 23/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import Foundation
import UIKit

public extension NSObject{
    public class var nameOfClass: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public var nameOfClass: String{
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}

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
