//
//  WhiteBlueController.swift
//  NSSplitViewController
//
//  Created by Jonathan Amburgy on 10/14/26.
//

import Cocoa

class WhiteViewController: NSViewController {
    
    var whiteView = NSView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        whiteView.wantsLayer = true
        whiteView.layer?.backgroundColor = NSColor.white.cgColor
        whiteView.frame = view.bounds
        view.addSubview(whiteView)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}
