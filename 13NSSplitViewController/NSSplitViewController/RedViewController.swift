//
//  RedViewController.swift
//  NSSplitViewController
//
//  Created by Jonathan Amburgy on 10/14/26.
//

import Cocoa

class RedViewController: NSViewController {
    
    var redView = NSView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        redView.wantsLayer = true
        redView.layer?.backgroundColor = NSColor.red.cgColor
        redView.frame = view.bounds
        view.addSubview(redView)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}
