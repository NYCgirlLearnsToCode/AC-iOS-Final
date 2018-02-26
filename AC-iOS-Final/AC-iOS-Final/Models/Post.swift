//
//  Post.swift
//  
//
//  Created by Lisa J on 2/26/18.
//

import Foundation

class Post {
    let postID: String
    let userID: String
    let caption: String
    let username: String
    let postImageStr: String?
    
    init(dict: [String : Any]) {
        self.postID = dict["postID"] as? String ?? ""
        self.userID = dict["userID"] as? String ?? ""
        self.caption = dict["caption"] as? String ?? ""
        self.username = dict["username"] as? String ?? ""
        self.postImageStr = dict["postImageStr"] as? String ?? ""
    }
}
