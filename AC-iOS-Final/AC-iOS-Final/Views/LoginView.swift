//
//  LoginView.swift
//  AC-iOS-Final
//
//  Created by Lisa J on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    lazy var imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "meatly_logo")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var emailLoginTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        textField.placeholder = "Email Address "
        textField.text = "imnotlostrui@aim.com"
        textField.layer.cornerRadius = 5
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        textField.placeholder = "Password"
        textField.text = "testtest"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true // this helps to obscure the user's password with *******
        //        textField.layer.borderWidth = 1
        //        textField.layer.cornerRadius = 5
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: UIControlState.normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .gray
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: UIControlState.normal)
       // button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .gray
        return button
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
        setupImageView()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupRegisterButton()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
         imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }
    
    private func setupEmailTextField() {
        addSubview(emailLoginTextField)
        emailLoginTextField.translatesAutoresizingMaskIntoConstraints = false
        emailLoginTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        emailLoginTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emailLoginTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
    }
    
    private func setupPasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailLoginTextField.bottomAnchor, constant: 8).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
    }
    
    private func setupLoginButton() {
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        
    }
    
    private func setupRegisterButton() {
        addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 8).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
    }

}
