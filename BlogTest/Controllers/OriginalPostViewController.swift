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
    var loadingIndicator: UIActivityIndicatorView!
    
    private var kvoContext: UInt8 = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        setupWebView()
        setupConstraints()
    }
    
    func configureNavBar() {
        loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .White)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: loadingIndicator)
    }
    
    func setupWebView() {
        webView = WKWebView()
        webView.frame = view.frame
        let URL = NSURL(string: postOriginURLString)
        let request = NSURLRequest(URL: URL!)
        webView.loadRequest(request)
        
        view.addSubview(webView)
        
        webView.addObserver(self, forKeyPath: "loading", options: .New, context: &kvoContext)
    }
    
    func setupConstraints() {
        var allConstraints: [NSLayoutConstraint] = []
        
        let views = [
            "webView": webView
        ]
        
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[webView]|",
            options: [],
            metrics: nil,
            views: views
        )
        allConstraints += verticalConstraints
        
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[webView]|",
            options: [],
            metrics: nil,
            views: views
        )
        allConstraints += horizontalConstraints
        
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if context == &kvoContext && keyPath == "loading" {
            if let webView = object as? WKWebView {
                webView.loading
                    ? loadingIndicator.startAnimating()
                    : loadingIndicator.stopAnimating()
            }
        }
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: "loading")
    }
}
