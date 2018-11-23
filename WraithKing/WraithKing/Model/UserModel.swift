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
    
    
//    "id": "-mbZihOlyNc",
//    "updated_at": "2018-11-22T23:52:12-05:00",
//    "username": "jennycaywood",
//    "name": "Jenny Caywood",
//    "first_name": "Jenny",
//    "last_name": "Caywood",
//    "twitter_username": null,
//    "portfolio_url": "http://JourneyofJenny.com",
//    "bio": "I'm a 19 year old adventure-seeker living out my dream as a photographer! Shoot me a message on Instagram or on my website if you have any questions or want a specific shot.\r\n Insta @jennycaywood",
//    "location": "Seattle, WA",
//    "links": {
//    "self": "https://api.unsplash.com/users/jennycaywood",
//    "html": "https://unsplash.com/@jennycaywood",
//    "photos": "https://api.unsplash.com/users/jennycaywood/photos",
//    "likes": "https://api.unsplash.com/users/jennycaywood/likes",
//    "portfolio": "https://api.unsplash.com/users/jennycaywood/portfolio",
//    "following": "https://api.unsplash.com/users/jennycaywood/following",
//    "followers": "https://api.unsplash.com/users/jennycaywood/followers"
//    },
//    "profile_image": {
//    "small": "https://images.unsplash.com/profile-1537569350709-a3402771f828?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32&s=8547f41c61c21c2f3293b5828dd1d482",
//    "medium": "https://images.unsplash.com/profile-1537569350709-a3402771f828?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64&s=7d5287b60724dfb1f272e3d497d49925",
//    "large": "https://images.unsplash.com/profile-1537569350709-a3402771f828?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128&s=f340c628ecd1c5b6861e0de69f80b300"
//    },
//    "instagram_username": "jennycaywood",
//    "total_collections": 0,
//    "total_likes": 0,
//    "total_photos": 48,
}
