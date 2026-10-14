//
//  BlueViewController.swift
//  NSSplitViewController
//
//  Created by Jonathan Amburgy on 10/14/26.
//

import Cocoa

class BlueViewController: NSViewController {
    
    var blueView = NSView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        blueView.wantsLayer = true
        blueView.layer?.backgroundColor = NSColor.blue.cgColor
        blueView.frame = view.bounds
        view.addSubview(blueView)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}
