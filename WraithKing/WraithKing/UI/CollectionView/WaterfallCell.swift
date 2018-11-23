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
        // Initialization code
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
    
    func configure(model: UnsplashModel) {
        self.imageView.hero.id = model.id
        self.background.hero.id = model.id + "color"
        
        self.backgroundColor = UIColor(hex: model.color!)
        self.background.backgroundColor = UIColor(hex: model.color!)
        let url = URL(string: (model.urls?.small)!)!
        self.imageView.kf.setImage(with: url)
    }
}
