//
//  DBService+Users.swift
//  AC-iOS-Final
//
//  Created by Lisa J on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import Firebase

extension DBService {
    public func addUser() {
        let childByAutoId = DBService.manager.getUsers().childByAutoId()
        childByAutoId.setValue(["userID"       : AuthUserService.getCurrentUser()!.uid,
                                "userDBid"     : childByAutoId.key,
                                "username"     : AuthUserService.getCurrentUser()!.displayName!,
                                "userImageStr" : ""]) { (error, dbRef) in
                                    if let error = error {
                                        print("addUser error: \(error.localizedDescription)")
                                    } else {
                                        print("user added @ database reference: \(dbRef)")
                                        // add an image to FireBase Storage & CoreData
                                        // StorageService.manager.storeUserImage(image: image, userId: childByAutoId.key)
                                        // TODO: add image to CoreData
                                    }
        }
    }
    
    public func updateUserName(userID: String, username: String) {
        DBService.manager.getUsers().child(userID).updateChildValues(["username": username])
    }
    
    public func updateUserHeadline(userID: String, userBio: String) {
        DBService.manager.getUsers().child(userID).updateChildValues(["userBio": userBio])
    }
    
    public func updateUserImage(userID: String, userImageStr: String) {
        DBService.manager.getUsers().child(userID).updateChildValues(["userImageStr": userImageStr])
    }
    
    
    public func loadAllUsers(completionHandler: @escaping ([MeatlyUser]?) -> Void) {
        let ref = DBService.manager.getUsers()
        ref.observe(.value) { (snapshot) in
            var allUsers = [MeatlyUser]()
            for child in snapshot.children {
                let dataSnapshot = child as! DataSnapshot
                if let dict = dataSnapshot.value as? [String: Any] {
                    let user = MeatlyUser.init(dict: dict)
                    allUsers.append(user)
                }
            }
            completionHandler(allUsers)
        }
    }

}

