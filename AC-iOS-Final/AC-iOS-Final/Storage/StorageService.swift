//
//  StorageService.swift
//  
//
//  Created by Lisa J on 2/26/18.
//

import Foundation
import FirebaseStorage

class StorageService {
    private init(){
        storage = Storage.storage()
        storageRef = storage.reference()
        imagesRef = storageRef.child("images")
    }
    static let manager = StorageService()
    
    private var storage: Storage!
    private var storageRef: StorageReference!
    private var imagesRef: StorageReference!
    
    public func getStorageRef() -> StorageReference { return storageRef }
    public func getImagesRef() -> StorageReference { return imagesRef }
}
