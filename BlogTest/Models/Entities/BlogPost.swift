//
//  BlogPost.swift
//  BlogTest
//
//  Created by Dima Cheverda on 3/12/16.
//  Copyright © 2016 Dima Cheverda. All rights reserved.
//

import Foundation
import ObjectMapper

class BlogPost: Mappable {

    var title: String?
    var imageURL: String?
    var postDescription: String?
    var author: String?
    var viewsCount: Int = 0
    var originURL: String?
    
    required init?(_ map: Map) {

    }
    
    func mapping(map: Map) {
        title <- map["title"]
        imageURL <- map["image_url"]
        postDescription <- map["post_description"]
        author <- map["author"]
        viewsCount <- map["views_count"]
        originURL <- map["origin_url"]
    }
}
