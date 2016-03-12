//
//  BlogPostsViewController.swift
//  BlogTest
//
//  Created by Dima Cheverda on 3/12/16.
//  Copyright © 2016 Dima Cheverda. All rights reserved.
//

import UIKit

class BlogPostsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Stubs().setupStubs()
        
        RequestsManager().fetchBlogPosts { (results, error) -> () in
            guard error == nil else {
                print(error)
                return
            }
            
            if let results = results {
                print("results", results)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
