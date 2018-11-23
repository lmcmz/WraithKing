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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
    
    func configure(model: UnsplashModel) {
        self.backgroundColor = UIColor(hex: model.color!)
        let url = URL(string: (model.urls?.small)!)!
        self.imageView.kf.setImage(with: url)
    }
}
