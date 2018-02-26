//
//  UploadView.swift
//  AC-iOS-Final
//
//  Created by Lisa J on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class UploadView: UIView {
   
    lazy var selectImageButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "camera_icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var captionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "caption here"
        textView.textAlignment = .left
        textView.autocapitalizationType = .sentences
        textView.autocorrectionType = .yes
        textView.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        //textView.backgroundColor = .orange
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupSelectImageButton()
        setupCaptionTextView()
    }
  
    private func setupSelectImageButton() {
        addSubview(selectImageButton)
        selectImageButton.translatesAutoresizingMaskIntoConstraints = false
        selectImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        selectImageButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        selectImageButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        selectImageButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    
    private func setupCaptionTextView() {
        addSubview(captionTextView)
        captionTextView.translatesAutoresizingMaskIntoConstraints = false
        captionTextView.topAnchor.constraint(equalTo: selectImageButton.bottomAnchor, constant: 5).isActive = true
        captionTextView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        captionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        captionTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    }
}
