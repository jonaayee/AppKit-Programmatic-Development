//
//  ViewController.swift
//  LabelsWithNSTextFieldWithoutConfig
//
//  Created by Jonathan Amburgy on 10/7/26.
//

import Cocoa

class ViewController: NSViewController {
    
    var label = NSTextField(labelWithString: "Enter text here!") // Follows all the same four rules
    
    // Rule 1: Must disable the bezel
    // Rule 2: Must not be editible
    // Rule 3: Must not draw a background
    // Rule 4: Can not be selectable

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureUI()
    }
    
    private func configureUI() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 128)
        ])
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}
