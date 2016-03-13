//
//  BlogPostsViewController.swift
//  BlogTest
//
//  Created by Dima Cheverda on 3/12/16.
//  Copyright © 2016 Dima Cheverda. All rights reserved.
//

import UIKit

class BlogPostsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var blogPosts: [BlogPost] = []
    var selectedBlogPost: BlogPost?
    
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
    
    func fetchBlogPosts() {
        RequestsManager().fetchBlogPosts { (results, error) -> () in
            guard error == nil else {
                print(error)
                return
            }
            
            if let results = results as? [BlogPost] {
                self.blogPosts = results
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Open Post" {
            if let destination = segue.destinationViewController as? OriginalPostViewController,
                let originURL = selectedBlogPost?.originURL {
                    destination.postOriginURLString = originURL
            }
        }
    }
}

extension BlogPostsViewController: UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogPosts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(BlogPostCell), forIndexPath: indexPath) as! BlogPostCell
        
        let post = blogPosts[indexPath.row]
        
        cell.configure(post)
        
        return cell
    }
}

extension BlogPostsViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        selectedBlogPost = blogPosts[indexPath.row]
        performSegueWithIdentifier("Open Post", sender: self)
    }
}
