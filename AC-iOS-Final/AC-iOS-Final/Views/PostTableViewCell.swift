//
//  PostTableViewCell.swift
//  AC-iOS-Final
//
//  Created by Lisa J on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import Kingfisher

class PostTableViewCell: UITableViewCell {
    
    lazy var postCaption: UITextView = {
        let label = UITextView()
        label.text = "Caption"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.isScrollEnabled = false
        return label
    }()
    
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "camera_icon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Post Cell")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor.white
        setupViews()
    }
    
    private func setupViews() {
        setupPostImageView()
        setupPostCaption()
    }
    
    private func setupPostImageView() {
        addSubview(postImageView)
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        postImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        postImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
    }
    
    private func setupPostCaption() {
        addSubview(postCaption)
        postCaption.translatesAutoresizingMaskIntoConstraints = false
        postCaption.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8).isActive = true
        postCaption.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        postCaption.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        postCaption.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
    }
    
    public func configurePostCell(post: Post) {
        postCaption.text = post.caption
        if let imageURL = post.postImageStr {
            postImageView.kf.indicatorType = .activity
            postImageView.kf.setImage(with: URL(string: imageURL), placeholder: UIImage.init(named: "chickenleg"), options: nil, progressBlock: nil) { (image, error, cacheType, url) in
            }
        }
    }
}
