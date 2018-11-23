//
//  DetailViewController.swift
//  WraithKing
//
//  Created by lmcmz on 23/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class DetailViewController: UIViewController
{
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var usrNameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    var model: UnsplashModel?
    
    class func createDetailVC(model: UnsplashModel) -> DetailViewController {
        let detailVC = DetailViewController()
        detailVC.model = model
        return detailVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        imageView.hero.id = model?.id
//        self.view.hero.id = (model?.id)! + "color"
        
        let imgURL = URL(string: (model?.urls?.full)!)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: imgURL)
        
        let usrImgURL = URL(string: (model?.user?.profile_image?.medium)!)
        userImageView.kf.setImage(with: usrImgURL)
        
        usrNameLabel.text = model?.user?.username
        locationLabel.text = model?.user?.location
        if model?.user?.location == nil {
            locationLabel.text = "ins: "+(model?.user!.instagram_username)!
        }
        
        let rawWidth = CGFloat((model?.width)!)
        let rawHeight = CGFloat((model?.height)!)
        imageHeight.constant = Constants.SCREEN_WIDTH * (rawHeight / rawWidth)
        
//        self.imageView.kf.setImage(with: imgURL, placeholder: Placeholder(imgURL))
//        self.imageView.kf.placeholder
//        self.view.backgroundColor = UIColor(hex: (model?.color)!)
    }
    
    @IBAction func backButtonClick() {
        self.hero.dismissViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
