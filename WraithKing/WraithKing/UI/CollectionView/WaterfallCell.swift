//
//  WaterfallCell.swift
//  WraithKing
//
//  Created by lmcmz on 23/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class WaterfallCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.lightGray
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: 3, height: 3)
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowRadius = 8.0
    }
    
    func configure(model: UnsplashModel) {
        self.imageView.hero.id = model.id
//        self.background.hero.id = model.id + "color"
        
        self.backgroundColor = UIColor(hex: model.color!)
        self.background.backgroundColor = UIColor(hex: model.color!)
        let url = URL(string: (model.urls?.small)!)!
//        let resource = ImageResource(downloadURL: url, cacheKey: model.id)
//        self.imageView.kf.setImage(with: resource)
        self.imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
}
