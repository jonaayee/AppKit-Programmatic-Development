//
//  ViewController.swift
//  LabelswithNSTextField
//
//  Created by Jonathan Amburgy on 10/7/26.
//

import Cocoa

class ViewController: NSViewController {
    
    var label1 = NSTextField() // creates a static text object

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureUI()
    }
    
    private func configureUI() {
        
        // Rule 1: Must disable the bezel
        // Rule 2: Must not be editible
        // Rule 3: Must not draw a background
        // Rule 4: Can not be selectable
        
        label1.stringValue = "This is a Label"
        label1.isBezeled = false // Rule 1
        label1.isEditable = false // Rule 2
        label1.drawsBackground = false // Rule 3
        label1.isSelectable = false // Rule 4
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label1)
        
        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label1.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

