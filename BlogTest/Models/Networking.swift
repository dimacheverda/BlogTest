//
//  Networking.swift
//  BlogTest
//
//  Created by Dima Cheverda on 3/12/16.
//  Copyright © 2016 Dima Cheverda. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class RequestsManager: NSObject {
    
    private let URLString = "https://yalantis.com/blog/"
    
    func fetchBlogPosts(completion: ((posts: [AnyObject]?, error: NSError?) -> ())?) {
        Alamofire.request(.GET, URLString)
            .responseJSON { (response) -> Void in
                guard completion != nil else {
                    return
                }
                
                if let value = response.result.value {
                    if let getBlogPostsResponse = self.parseGetBlogPostsResponse(value) {
                        completion!(posts: getBlogPostsResponse.posts, error: nil)
                    } else {
                        completion!(posts: nil, error: NSError(domain: "NetworkingDomain", code: 1002, userInfo: nil))
                    }
                } else {
                    completion!(posts: nil, error: NSError(domain: "NetworkingDomain", code: 1003, userInfo: nil))
                }
        }
    }
  
    private func parseGetBlogPostsResponse(data: AnyObject) -> GetBlogPostsResponse? {
        return Mapper<GetBlogPostsResponse>().map(data)
    }
}
