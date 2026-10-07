//
//  ViewController.swift
//  CreatingAWrappingLabel
//
//  Created by Jonathan Amburgy on 10/7/26.
//

import Cocoa

class ViewController: NSViewController {
    
    var label = NSTextField(wrappingLabelWithString: "A very long string to the point where it will need to split into several lines")

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


