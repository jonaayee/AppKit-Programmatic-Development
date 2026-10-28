//
//  ViewController.swift
//  Horizontal NSSlider
//
//  Created by Jonathan Amburgy on 10/26/26.
//

import Cocoa

class ViewController: NSViewController {
    
    var valueField = NSTextField()
    
    var valueSlider = NSSlider(value: 0, minValue: 0, maxValue: 100, target: nil, action: #selector(valueChanged))

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        valueField.stringValue = "0"
        valueField.translatesAutoresizingMaskIntoConstraints = false
        
        valueSlider.trackFillColor = .systemRed
        valueSlider.altIncrementValue = 10.00
        valueSlider.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(valueField)
        view.addSubview(valueSlider)
        
        NSLayoutConstraint.activate([
            valueField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            valueField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            valueField.widthAnchor.constraint(equalToConstant: 150),
            
            valueSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            valueSlider.leadingAnchor.constraint(equalTo: valueField.trailingAnchor, constant: 20),
            valueSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @objc private func valueChanged(_ slider: NSSlider) {
        valueField.stringValue = "\(valueSlider.integerValue)"
    }

}

