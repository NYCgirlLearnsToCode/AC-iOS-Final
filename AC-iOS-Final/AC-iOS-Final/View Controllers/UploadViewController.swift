//
//  UploadViewController.swift
//  AC-iOS-Final
//
//  Created by Lisa J on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import AVFoundation
import Toucan

class UploadViewController: UIViewController {

    private let uploadView = UploadView()
    private var currentUser = AuthUserService.getCurrentUser()
    private var postImage: UIImage!
    private let imagePicker = UIImagePickerController()
    private var authService = AuthUserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(uploadView)
        configureNavBar()
        uploadView.selectImageButton.addTarget(self, action: #selector(selectPhoto), for: .touchUpInside)
        imagePicker.delegate = self
    }
    
    private func configureNavBar() {
        navigationItem.title = "Upload"
        let doneBarItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneBarItem
    }
    
    func showAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func done() {
        
        let newCaption = uploadView.captionTextView.text!
        if newCaption.isEmpty == false {
            DBService.manager.addPosts(caption: uploadView.captionTextView.text ?? "", postImageStr: "no image", image: postImage ?? #imageLiteral(resourceName: "chickenleg"))
            showAlert(title: "Success", message: "Photo Uploaded")
            self.dismiss(animated: true, completion: nil)
        } else {
            showAlert(title: "Caption needed", message: "Please add caption")
        }
    }
    
    @objc private func selectPhoto() {
        self.launchCameraFunctions(type: UIImagePickerControllerSourceType.photoLibrary)
    }
    
    private func launchCameraFunctions(type: UIImagePickerControllerSourceType){
        if UIImagePickerController.isSourceTypeAvailable(type){
            imagePicker.sourceType = type
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }


}
extension UploadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage else { print("image is nil"); return }
        
        // resize the image
        let sizeOfImage: CGSize = CGSize(width: 300, height: 300)
        let toucanImage = Toucan.Resize.resizeImage(editedImage, size: sizeOfImage)
        self.postImage = toucanImage
        self.uploadView.selectImageButton.setImage(postImage, for: .normal)
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
