//
//  SelectPhotoViewController.swift
//  AC-iOS-Final
//
//  Created by Lisa J on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SelectPhotoViewController: UIViewController {

    let selectPhotoView = SelectPhotoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(selectPhotoView)
    }

}
