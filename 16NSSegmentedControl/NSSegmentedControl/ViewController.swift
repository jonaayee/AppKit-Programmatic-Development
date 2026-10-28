//
//  ViewController.swift
//  NSSegmentedControl
//
//  Created by Jonathan Amburgy on 10/22/26.
//

import Cocoa

class ViewController: NSViewController {
    
    // Segmented control is horizontally aligned buttons where they are next to each other through tracking modes
    
    // First tracking mode is Select 1, which allows you to have selection over one segement control
    // Second tracking mode is Select Any, which allows you to have selection over any segement control
    // Third tracking mode is Momentary, which allows you to treat each button as a button with no specialization, like the back and forward buttons in Finder or Safari
    // Fourth and final tracking mode is Momentary Accelerator, which allows the user to hold down a button of a segemented control, which will contiually will execute the action (can also respond to pressure from trackpads)
    
    var deviceImageView = NSImageView()
    
    var deviceControl = NSSegmentedControl() // You can pass an array of Strings, array of NSImages, tracking mode, action, and target
    
    var symbols: [(name: String, image: NSImage)] = [
        (name: "Mac", image: NSImage(systemSymbolName: "macbook.gen2", accessibilityDescription: "MacBook Pro")!),
        (name: "iPhone", image: NSImage(systemSymbolName: "iphone.gen3", accessibilityDescription: "iPhone")!),
        (name: "iPad", image: NSImage(systemSymbolName: "ipad.gen2", accessibilityDescription: "iPad")!),
        (name: "Apple Watch", image: NSImage(systemSymbolName: "applewatch", accessibilityDescription: "Apple Watch")!),
        (name: "Apple TV", image: NSImage(systemSymbolName: "appletv", accessibilityDescription: "Apple TV")!),
        (name: "Homepods", image: NSImage(systemSymbolName: "homepod.and.homepod.mini", accessibilityDescription: "Homepod and Homepod Mini")!),
        (name: "Apple Vision Pro", image: NSImage(systemSymbolName: "vision.pro", accessibilityDescription: "Apple Vision Pro")!),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        deviceImageView.image = symbols[0].image
        deviceImageView.imageScaling = .scaleProportionallyUpOrDown
        deviceImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deviceImageView)
        
        deviceControl.target = nil // could be .self
        deviceControl.action = #selector(selectionChanged) // connection to objc C
        deviceControl.trackingMode = .selectOne
        deviceControl.selectedSegment = 0
        deviceControl.segmentCount = symbols.count
        deviceControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deviceControl)
        
        for index in 0..<symbols.count {
            deviceControl.setLabel(symbols[index].name, forSegment: index)
        }
        
        NSLayoutConstraint.activate([
            deviceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            deviceImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deviceImageView.widthAnchor.constraint(equalToConstant: 400),
            deviceImageView.heightAnchor.constraint(equalToConstant: 400),
            
            deviceControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            deviceControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            deviceControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @objc private func selectionChanged(_ sc: NSSegmentedControl) {
        let selectedSegment = sc.selectedSegment
        
        deviceImageView.image = symbols[selectedSegment].image
    }
}

