//
//  BlogPostsViewController.swift
//  BlogTest
//
//  Created by Dima Cheverda on 3/12/16.
//  Copyright © 2016 Dima Cheverda. All rights reserved.
//

import UIKit

class BlogPostsViewController: UIViewController {

    //  MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    var posts: [BlogPost] = []
    
    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        fetchBlogPosts()
    }
    
    func setupTableView() {
        let blogPostCellNib = UINib(nibName: String(BlogPostCell), bundle: nil)
        tableView.registerNib(blogPostCellNib, forCellReuseIdentifier: String(BlogPostCell))
        tableView.rowHeight = 200.0
    }
    
    //  MARK: - Fetch
    
    func fetchBlogPosts() {
        RequestsManager().fetchBlogPosts { (results, error) -> () in
            guard error == nil else {
                print(error)
                return
            }
            
            if let results = results as? [BlogPost] {
                print("results", results)
                self.posts = results
                self.tableView.reloadData()
            }
        }
    }
}

extension BlogPostsViewController: UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(BlogPostCell), forIndexPath: indexPath) as! BlogPostCell
        
        let post = posts[indexPath.row]
        
        cell.configure(post)
        
        return cell
    }
}
