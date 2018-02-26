//
//  DBService+Posts.swift
//  AC-iOS-Final
//
//  Created by Lisa J on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import Firebase

extension DBService {
    
    public func addPosts(caption: String, postImageStr: String,image: UIImage) {
        let childByAutoId = DBService.manager.getPosts().childByAutoId()
        childByAutoId.setValue(["postID"        : childByAutoId.key,
                                "userID"        : AuthUserService.getCurrentUser()!.uid,
                                "caption"       : caption,
                                "username"      : AuthUserService.getCurrentUser()!.displayName!,
                                "postImageStr"  : postImageStr]) { (error, dbRef) in
                                    if let error = error {
                                        print("addPosts error: \(error)")
                                    } else {
                                        print("posts added @ database reference: \(dbRef)")
                                        // add an image to storage
                                        StorageService.manager.storePostImage(image: image, postId: childByAutoId.key)
                                        // TODO: add image to database
                                    }
        }
    }
    
    public func loadAllPosts(completionHandler: @escaping ([Post]?) -> Void) {
        let ref = DBService.manager.getPosts()
        ref.observe(.value) { (snapshot) in
            var allPosts = [Post]()
            for child in snapshot.children {
                let dataSnapshot = child as! DataSnapshot
                if let dict = dataSnapshot.value as? [String: Any] {
                    let post = Post.init(dict: dict)
                    allPosts.append(post)
                }
            }
            completionHandler(allPosts)
        }
}

    public func saveEditedPost(postID: String, caption: String, newCategory: String) {
        DBService.manager.getPosts().child(postID).updateChildValues(["caption":caption,"category": newCategory])
    }
}
