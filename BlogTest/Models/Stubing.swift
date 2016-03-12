//
//  Stubing.swift
//  BlogTest
//
//  Created by Dima Cheverda on 3/12/16.
//  Copyright © 2016 Dima Cheverda. All rights reserved.
//

import Foundation
import OHHTTPStubs


class Stubs: NSObject {

    func setupStubs() {
        let stubURLString = "yalantis.com"
        stub(isHost(stubURLString)) { _ in
            let stubPath = OHPathForFile("BlogPostsResponse.json", self.dynamicType)
            return fixture(stubPath!, headers: ["Content-Type":"application/json"])
        }
    }
}
