//
//  WaterfallLayout.swift
//  WraithKing
//
//  Created by lmcmz on 23/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import Foundation
import UIKit

@objc protocol WaterFallLayoutDelegate {
    func columnOfWaterFall(_ collectionView: UICollectionView) -> Int
    func waterFall(_ collectionView: UICollectionView, layout waterFallLayout: WaterFallLayout, heightForItemAt indexPath: IndexPath) -> CGFloat
}


class WaterFallLayout: UICollectionViewLayout {
    
    weak var delegate: WaterFallLayoutDelegate?
    @IBInspectable var lineSpacing: CGFloat   = 0
    @IBInspectable var columnSpacing: CGFloat = 0
    @IBInspectable var sectionTop: CGFloat    = 0 {
        willSet {
            sectionInsets.top = newValue
        }
    }
    @IBInspectable var sectionBottom: CGFloat  = 0 {
        willSet {
            sectionInsets.bottom = newValue
        }
    }
    @IBInspectable var sectionLeft: CGFloat   = 0 {
        willSet {
            sectionInsets.left = newValue
        }
    }
    @IBInspectable var sectionRight: CGFloat  = 0 {
        willSet {
            sectionInsets.right = newValue
        }
    }
    @IBInspectable var sectionInsets: UIEdgeInsets = UIEdgeInsets.zero
    private var columnHeights: [Int: CGFloat] = [Int: CGFloat]()
    private var attributes: [UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
    
    //MARK: Initial Methods
    init(lineSpacing: CGFloat, columnSpacing: CGFloat, sectionInsets: UIEdgeInsets) {
        super.init()
        self.lineSpacing = lineSpacing
        self.columnSpacing = columnSpacing
        self.sectionInsets = sectionInsets
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: Public Methods
    
    //MARK: Override
    override var collectionViewContentSize: CGSize {
        var maxHeight: CGFloat = 0
        for height in columnHeights.values {
            if height > maxHeight {
                maxHeight = height
            }
        }
        return CGSize.init(width: collectionView?.frame.width ?? 0, height: maxHeight + sectionInsets.bottom)
    }
    
    override func prepare() {
        super.prepare()
        guard collectionView != nil else {
            return
        }
        if let columnCount = delegate?.columnOfWaterFall(collectionView!) {
            for i in 0..<columnCount {
                columnHeights[i] = sectionInsets.top
            }
        }
        let itemCount = collectionView!.numberOfItems(inSection: 0)
        attributes.removeAll()
        for i in 0..<itemCount {
            if let att = layoutAttributesForItem(at: IndexPath.init(row: i, section: 0)) {
                attributes.append(att)
            }
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if let collectionView = collectionView {
            //Get Attributes by index
            let att = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
            //Get width of column
            let width = collectionView.frame.width
            if let columnCount = delegate?.columnOfWaterFall(collectionView) {
                guard columnCount > 0 else {
                    return nil
                }
                //item width = (collectionView width - gaps) / columnCount
                let totalWidth  = (width - sectionInsets.left - sectionInsets.right - (CGFloat(columnCount) - 1) * columnSpacing)
                let itemWidth   = totalWidth / CGFloat(columnCount)
                //get item height from protocol
                let itemHeight  = delegate?.waterFall(collectionView, layout: self, heightForItemAt: indexPath) ?? 0
                //Find the shortest column
                var minIndex = 0
                for column in columnHeights {
                    if column.value < columnHeights[minIndex] ?? 0 {
                        minIndex = column.key
                    }
                }
                //find x in shortest column
                let itemX  = sectionInsets.left + (columnSpacing + itemWidth) * CGFloat(minIndex)
                //item y = max Y in shortest cloumn + line Space
                let itemY  = (columnHeights[minIndex] ?? 0) + lineSpacing
                //Set attribute in frame
                att.frame  = CGRect.init(x: itemX, y: itemY, width: itemWidth, height: itemHeight)
                //update max y value in dict
                columnHeights[minIndex] = att.frame.maxY
            }
            return att
        }
        return nil
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributes
    }
}
