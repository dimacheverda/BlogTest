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

    //  MARK: - Oulets
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var viewsCountLabel: UILabel!
    
    //  MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //  MARK: - Configuration
    
    func configure(post: BlogPost) {
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
