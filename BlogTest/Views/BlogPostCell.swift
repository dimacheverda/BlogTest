//
//  BlogPostCell.swift
//  BlogTest
//
//  Created by Dima Cheverda on 3/12/16.
//  Copyright © 2016 Dima Cheverda. All rights reserved.
//

import UIKit
import SDWebImage

class BlogPostCell: UITableViewCell {
    
    var blogPost: BlogPost?

    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var viewsCountLabel: UILabel!
    @IBOutlet private weak var tintView: UIView!
    
    private let tintViewColor: UIColor = UIColor(white: 0.0, alpha: 0.6)
    private let selectedTintViewColor: UIColor = UIColor(white: 0.0, alpha: 0.45)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            tintView.backgroundColor = selectedTintViewColor
        } else {
            tintView.backgroundColor = tintViewColor
        }
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        if highlighted {
            tintView.backgroundColor = selectedTintViewColor
        } else {
            tintView.backgroundColor = tintViewColor
        }
    }

    func configure(post: BlogPost) {
        blogPost = post
        
        if let title = post.title {
            titleLabel.text = title
        }
        if let postDescription = post.postDescription {
            descriptionLabel.text = postDescription
        }
        if let author = post.author {
            authorLabel.text = author
        }
        if let imageURL = post.imageURL {
            let URL = NSURL(string: imageURL)
            backgroundImageView.sd_setImageWithURL(URL, placeholderImage: UIImage(named: "yalantis_placeholder"))
        }
        
        viewsCountLabel.text = "\(post.viewsCount) views"
    }
    
}
