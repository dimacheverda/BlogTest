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
    
    func fetchBlogPosts(completion: (([AnyObject]?, NSError?) -> ())?) {
        Alamofire.request(.GET, URLString)
            .responseJSON { (response) -> Void in
                guard completion != nil else {
                    return
                }
                
                if let value = response.result.value {
                    if value["data"] != nil {
                        let data = value["data"] as! [AnyObject]
                        print("data", data)
                        if let posts = self.parseBlogPosts(data) {
                            completion!(posts, nil)
                        } else {
                            completion!(nil, NSError(domain: "NetworkingDomain", code: 1001, userInfo: nil))
                        }
                    } else {
                        completion!(nil, NSError(domain: "NetworkingDomain", code: 1002, userInfo: nil))
                    }
                } else {
                    completion!(nil, NSError(domain: "NetworkingDomain", code: 1003, userInfo: nil))
                }
        }
    }
    
    private func parseBlogPosts(data: [AnyObject]) -> [BlogPost]? {
        return data.map { (postJSON) -> BlogPost in
            return Mapper<BlogPost>().map(postJSON)!
        }
    }
}
