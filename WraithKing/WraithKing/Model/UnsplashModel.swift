//
//  unsplashModel.swift
//  WraithKing
//
//  Created by lmcmz on 22/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import Foundation
import HandyJSON

class ImgModel: HandyJSON {
    var raw: String?
    var full: String?
    var regular: String?
    var small: String?
    var thumb: String?
     required init() {}
}

class LinkModel: HandyJSON {
    var html: String?
    var download: String?
    var download_location: String?
    required init() {}
}

class UnsplashModel: HandyJSON {
    var id: String!
    var created_at: String?
    var updated_at: String?
    var urls: ImgModel?
    var links: LinkModel?
    var likes: Int!
    var description: String?
    var user: UserModel?
    var color: String?
    var width: Int!
    var height: Int!
    required init() {}
}
