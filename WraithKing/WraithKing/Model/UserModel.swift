//
//  UserModel.swift
//  WraithKing
//
//  Created by lmcmz on 22/11/18.
//  Copyright © 2018 lmcmze. All rights reserved.
//

import Foundation
import HandyJSON

class Avatar: HandyJSON {
    var small: String?
    var medium: String?
    var large: String?
    required init() {}
}

class UserModel: HandyJSON {
    var id: String!
    var username: String!
    var bio: String?
    var location: String?
    var profile_image: Avatar?
    var instagram_username: String?
    
    required init() {}
}
