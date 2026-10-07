//
//  ViewController.swift
//  Checkboxes
//
//  Created by Jonathan Amburgy on 10/6/26.
//

import Cocoa

class ViewController: NSViewController {
    var button = NSButton(checkboxWithTitle: "Check me Please!", target: nil, action: nil) // instead of a button, shows a checkbox
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureButton()
    }
    
    private func configureButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        // Button properties
        button.bezelColor = NSColor.red // What color the checkmark appears as when clicked
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 148),
            button.heightAnchor.constraint(equalToConstant: 24)
        ])
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
