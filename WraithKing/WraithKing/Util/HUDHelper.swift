//
//  HUDHelper.swift
//  WraithKing
//
//  Created by lmcmz on 24/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

class HUDHelper: NSObject, NVActivityIndicatorViewable
{
    static let sharedHelper = HUDHelper()
    
    func showText(text: String) {
        let size = CGSize(width: 40, height: 40)
        let data = ActivityData(size: size, message: text, messageFont: nil, messageSpacing: nil, type: NVActivityIndicatorType(rawValue: 0), color: UIColor.black, padding: nil, displayTimeThreshold: 2, minimumDisplayTime: 2, backgroundColor: UIColor.init(white: 1, alpha: 0.2), textColor: UIColor.black)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(data, NVActivityIndicatorView.DEFAULT_FADE_IN_ANIMATION)
    }
    
    func show() {
        showText(text: "")
    }
    
    func remove()  {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(NVActivityIndicatorView.DEFAULT_FADE_OUT_ANIMATION)
    }
    
}
