//
//  ViewController.swift
//  WraithKing
//
//  Created by lmcmz on 22/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, WaterFallLayoutDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!
    var dataCount = 20
    var columnCount = 2
    var pages = 0
    
    var data: [UnsplashModel?]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: WaterfallCell.nameOfClass, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: WaterfallCell.nameOfClass)
        
        requestData()
        (collectionView.collectionViewLayout as? WaterFallLayout)?.delegate = self
    }
    
    func requestData() {
        weak var weakSelf = self
        unsplashProvider.request(.photos(pages)) { (result) in
            if case let .success(response) = result {
                let model = response.mapArray(UnsplashModel.self)
//                print(model!.count)
                weakSelf?.data = model
                weakSelf?.collectionView.reloadData()
            }
        }
    }
    
    //MARK: CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
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
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Identifier", for: indexPath)
//        cell.contentView.backgroundColor    = [UIColor.blue, UIColor.red, UIColor.yellow][indexPath.row % 3]
//        cell.contentView.clipsToBounds      = true
//        cell.contentView.layer.cornerRadius = 5
//        return cell
    }
    
    //MARK: WCLWaterFallLayoutDelegate
    
    func waterFall(_ collectionView: UICollectionView, layout waterFallLayout: WaterFallLayout, heightForItemAt indexPath: IndexPath) -> CGFloat {
//        let height = 200 + arc4random() % 100
//        return CGFloat(height)
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

