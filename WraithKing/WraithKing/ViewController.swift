//
//  ViewController.swift
//  WraithKing
//
//  Created by lmcmz on 22/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import UIKit
import Hero
//import VBFPopFlatButton
import SVPullToRefresh
import NVActivityIndicatorView

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, WaterFallLayoutDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var navBar: UIVisualEffectView!
    @IBOutlet var titleLabel: UILabel!
//    @IBOutlet var categoryButton: VBFPopFlatButton!
//    @IBOutlet var menuButton: VBFPopFlatButton!
    
    var dataCount = 20
    var columnCount = 2
//    var pages = 0
    var page: Int = 0
//    var pageCount: Int = 0
    
    var data: [UnsplashModel?]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.isEnabled = true
        
        let nib = UINib.init(nibName: WaterfallCell.nameOfClass, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: WaterfallCell.nameOfClass)
        collectionView.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
        
        requestData(page: page)
        
        (collectionView.collectionViewLayout as? WaterFallLayout)?.delegate = self
        
        collectionView.addInfiniteScrolling {
            self.collectionView.infiniteScrollingView.startAnimating()
            self.requestData(page: self.page)
        }
    }
    
    func requestData(page: Int) {
        weak var weakSelf = self
        unsplashProvider.request(.photos(page)) { (result) in
            if case let .success(response) = result {
                let model = response.mapArray(UnsplashModel.self)
                if weakSelf!.data != nil {
                    weakSelf!.data = weakSelf!.data! + model!
                    // Remove duplicate
                } else {
                    weakSelf!.data = model
                }
                weakSelf?.page += 1
                weakSelf!.collectionView.infiniteScrollingView.stopAnimating()
                weakSelf?.collectionView.reloadData()
            }
        }
    }
    
     //MARK: ScrollView Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y + 30
        let alpha = y / 60
        
        navBar.alpha = min(alpha, 1)
        //        navBar.alpha = 1
//        categoryButton.alpha = min(alpha, 1)
        titleLabel.alpha = 1 - min(alpha, 1)
    }
    
    //MARK: CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
        let model = self.data![indexPath.item]
        let detailVC = DetailViewController.createDetailVC(model: model!)
        self.present(detailVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WaterfallCell.nameOfClass, for: indexPath) as! WaterfallCell
        let index = indexPath.item
        cell.configure(model: self.data![index]!)
        return cell
    }
    
    //MARK: WCLWaterFallLayoutDelegate
    
    func waterFall(_ collectionView: UICollectionView, layout waterFallLayout: WaterFallLayout, heightForItemAt indexPath: IndexPath) -> CGFloat {
        let width = (Constants.SCREEN_WIDTH - waterFallLayout.sectionLeft - waterFallLayout.sectionRight - waterFallLayout.lineSpacing)/2
        let index = indexPath.item
        let model = self.data![index]
        let rawWidth = CGFloat((model?.width)!)
        let rawHeight = CGFloat((model?.height)!)
        return rawHeight * (width/rawWidth)
    }
    
    func columnOfWaterFall(_ collectionView: UICollectionView) -> Int {
        return columnCount
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

