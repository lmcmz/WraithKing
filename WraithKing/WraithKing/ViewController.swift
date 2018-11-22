//
//  ViewController.swift
//  WraithKing
//
//  Created by lmcmz on 22/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        test()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func test() {
        unsplashProvider.request(.photos()) { (result) in
            if case let .success(response) = result {
                let model = response.mapArray(UnsplashModel.self)
                print(model?.count)
            }
        }
    }
}

