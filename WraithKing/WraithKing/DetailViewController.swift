//
//  DetailViewController.swift
//  WraithKing
//
//  Created by lmcmz on 23/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var model: UnsplashModel?
    
    class func createDetailVC(model: UnsplashModel) -> DetailViewController {
        let detailVC = DetailViewController()
        detailVC.model = model
        return detailVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true;
        self.imageView.hero.id = model?.id
        self.view.hero.id = (model?.id)! + "color"
        
        let imgURL = URL(string: (model?.urls?.regular)!)
        self.imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(with: imgURL)
//        self.imageView.kf.placeholder
//        self.imageView.kf.setImage(with: imgURL, placeholder: <#T##Placeholder?#>, options: <#T##KingfisherOptionsInfo?#>, progressBlock: <#T##DownloadProgressBlock?##DownloadProgressBlock?##(Int64, Int64) -> Void#>, completionHandler: <#T##CompletionHandler?##CompletionHandler?##(Image?, NSError?, CacheType, URL?) -> Void#>)
        self.view.backgroundColor = UIColor(hex: (model?.color)!)
    }
    
    @IBAction func backButtonClick() {
        self.hero.dismissViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
