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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
        (collectionView.collectionViewLayout as? WaterFallLayout)?.delegate = self
    }
    
    func test() {
        unsplashProvider.request(.photos()) { (result) in
            if case let .success(response) = result {
                let model = response.mapArray(UnsplashModel.self)
                print(model!.count)
            }
        }
    }
    
    //MARK: CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Identifier", for: indexPath)
        cell.contentView.backgroundColor    = [UIColor.blue, UIColor.red, UIColor.yellow][indexPath.row % 3]
        cell.contentView.clipsToBounds      = true
        cell.contentView.layer.cornerRadius = 5
        return cell
    }
    
    //MARK: WCLWaterFallLayoutDelegate
    
    func waterFall(_ collectionView: UICollectionView, layout waterFallLayout: WaterFallLayout, heightForItemAt indexPath: IndexPath) -> CGFloat {
        let height = 200 + arc4random() % 100
        return CGFloat(height)
    }
    
    func columnOfWaterFall(_ collectionView: UICollectionView) -> Int {
        return columnCount
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

