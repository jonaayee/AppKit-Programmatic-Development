//
//  ViewController.swift
//  NSSecureTextFieldAndAccessingTheLayer
//
//  Created by Jonathan Amburgy on 10/12/26.
//

import Cocoa

class ViewController: NSViewController {
    
    var usernameLabel = NSTextField(labelWithString: "Username")
    var passwordLabel = NSTextField(labelWithString: "Password")
    var usernameField = NSTextField()
    var passwordField = NSSecureTextField()
    var loginButton = NSButton(title: "Login", target: nil, action: #selector(loginClicked))

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    private func configureUI() {
        configureFields()
        configureLoginButton()
        addSubViews([usernameLabel, usernameField, passwordLabel, passwordField, loginButton])
        configureConstraints()
    }
    
    private func configureFields() {
        usernameField.placeholderString = "Username"
        passwordField.placeholderString = "Password"
        
        usernameField.wantsLayer = true // gives a CALayer, optional value
        passwordField.wantsLayer = true
        
        usernameField.layer?.borderWidth = 4
        usernameField.layer?.borderColor = NSColor.labelColor.cgColor
        
        passwordField.layer?.borderWidth = 4
        passwordField.layer?.borderColor = NSColor.labelColor.cgColor
        
    }
    
    private func configureLoginButton() {
        loginButton.bezelColor = .systemBlue
    }
    
    private func addSubViews(_ views: [NSView]) {
        for subview in views {
            view.addSubview(subview)
        }
    }
    
    private func configureConstraints() {
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 128),
            
            passwordLabel.trailingAnchor.constraint(equalTo: passwordField.leadingAnchor, constant: -20),
            passwordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            passwordLabel.widthAnchor.constraint(equalToConstant: 128),
            
            usernameField.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -20),
            usernameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameField.widthAnchor.constraint(equalToConstant: 128),
            
            usernameLabel.trailingAnchor.constraint(equalTo: usernameField.leadingAnchor, constant: -20),
            usernameLabel.centerYAnchor.constraint(equalTo: usernameField.centerYAnchor),
            usernameLabel.widthAnchor.constraint(equalToConstant: 128),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalTo: passwordField.widthAnchor)
        ])
    }
    
    @objc
    private func loginClicked() {
        print("Username: \(usernameField.stringValue) \nPassword: \(passwordField.stringValue)")
    }

}



