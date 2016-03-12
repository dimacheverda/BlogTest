//
//  OriginalPostViewController.swift
//  BlogTest
//
//  Created by Dima Cheverda on 3/13/16.
//  Copyright © 2016 Dima Cheverda. All rights reserved.
//

import UIKit
import WebKit

class OriginalPostViewController: UIViewController {
    
    var postOriginURLString: String = ""
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.frame
    }
    
    func setupWebView() {
        webView = WKWebView()
        webView.frame = view.frame
        let URL = NSURL(string: postOriginURLString)
        let request = NSURLRequest(URL: URL!)
        webView.loadRequest(request)
        
        view.addSubview(webView)
    }
}
