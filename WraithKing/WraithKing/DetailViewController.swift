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
import KRProgressHUD

class DetailViewController: UIViewController
{
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var usrNameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var isFinished = false
    
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
        imageView.kf.setImage(with: imgURL, placeholder: nil, options: [.transition(.fade(0.2))], progressBlock: nil) { (image, _, _, _) in
            self.isFinished = true
        }
        
        let usrImgURL = URL(string: (model?.user?.profile_image?.medium)!)
        userImageView.kf.setImage(with: usrImgURL)
        
        usrNameLabel.text = model?.user?.username
        locationLabel.text = model?.user?.location
        if model?.user?.location == nil  && model?.user!.instagram_username != nil{
            locationLabel.text = "ins: "+(model?.user!.instagram_username)!
        }
        likeLabel.text = String(model!.likes!) + " likes"
        
        let rawWidth = CGFloat((model?.width)!)
        let rawHeight = CGFloat((model?.height)!)
        imageHeight.constant = Constants.SCREEN_WIDTH * (rawHeight / rawWidth)
        
        sizeLabel.text = String(model!.width!) + " x " + String(model!.height!)
        
        let date = model?.updated_at?.readDateFromString(formatter: "yyyy-MM-dd'T'HH:mm:ssZZZZZ")
        dateLabel.text = date?.printDateFromDate(formatter: "MMM.dd")
//        self.imageView.kf.setImage(with: imgURL, placeholder: Placeholder(imgURL))
//        self.imageView.kf.placeholder
//        self.view.backgroundColor = UIColor(hex: (model?.color)!)
    }
    
    @IBAction func downloadButtonClick() {
        if isFinished {
            UIImageWriteToSavedPhotosAlbum(self.imageView.image!, self,  #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
            return
        }
        KRProgressHUD.showMessage("Image is downloading")
    }
    
    //MARK: - Add image to Library
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if error != nil {
            // we got back an error!
            KRProgressHUD.showError(withMessage: "Save image failed")
        } else {
            KRProgressHUD.showSuccess(withMessage: "Image Saved")
        }
    }
    
    @IBAction func backButtonClick() {
        self.hero.dismissViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
