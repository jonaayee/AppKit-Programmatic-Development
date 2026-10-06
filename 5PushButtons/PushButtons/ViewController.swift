//
//  ViewController.swift
//  PushButtons
//
//  Created by Jonathan Amburgy on 10/6/26.
//

import Cocoa

class ViewController: NSViewController {

    // This method of creating a view, view controller and view should be seperated
    
    var button = NSButton(title: "Click Me Please!", target: nil, action: #selector(buttonClicked)) // # is used to referrence Objective-C
    // target can be any object/view
    // you can include an image via NSImageView
    // A selector is how Objective-C and Swift communicate with each other, must be a function marked with @objc
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureButton()
    }
    
    // Button is in dead-space without this function configuring it in a window
    private func configureButton() {
        button.translatesAutoresizingMaskIntoConstraints = false // With it being true, you have to specify a frame and (x,y) coordinates
        view.addSubview(button) // where a seperate view would go, but because a NSButton is a subclass of NSView it can be added
        
        // Button properties
        button.bezelColor = NSColor.red // color
        
        // Sizing/padding (constraints)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor), // centered button
            // Anchors are a specific points on the screen (top, bottom, leading[left], trailing[right], etc.)
            button.widthAnchor.constraint(equalToConstant: 128), // pixels on macOS, iOS-based is units
            button.heightAnchor.constraint(equalToConstant: 24)
            // Anchors in this case provide a size to the button, can be calculated or static
        ])
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    // Objective-C Method
    @objc
    private func buttonClicked() {
        print("Button was Clicked! Width: \(button.frame.width)")
    }
}

// Google is a great way to find documentation, videos, examples, and functioning snipbits of code/methods
