//
//  MeatlyUser.swift
//  AC-iOS-Final
//
//  Created by Lisa J on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

struct MeatlyUser: Codable {
    let userID: String
    let userDBid: String
    let username: String
    let userImageStr: String?
    
    init(dict: [String : Any]) {
        userID = dict["userID"] as? String ?? ""
        userDBid = dict["userDBid"] as? String ?? ""
        username = dict["username"] as? String ?? ""
        userImageStr = dict["userImageStr"] as? String ?? ""
    }
    
    
}
