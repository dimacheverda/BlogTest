//
//  GetBlogPostsResponse.swift
//  BlogTest
//
//  Created by Dima Cheverda on 3/12/16.
//  Copyright © 2016 Dima Cheverda. All rights reserved.
//

import Foundation
import ObjectMapper

class GetBlogPostsResponse: Mappable {
    
    var posts: [BlogPost]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        posts <- map["data"]
    }
}
