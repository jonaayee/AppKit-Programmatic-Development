//
//  ViewController.swift
//  NSSplitViewController
//
//  Created by Jonathan Amburgy on 10/14/26.
//

import Cocoa

class ViewController: NSSplitViewController {
    
    let redVC = RedViewController()
    let whiteVC = WhiteViewController()
    let blueVC = BlueViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        let redItem = NSSplitViewItem(viewController: redVC)
        let whiteItem = NSSplitViewItem(viewController: whiteVC)
        let blueItem = NSSplitViewItem(viewController: blueVC)
        
        splitView.isVertical = false
        
        addSplitViewItem(redItem)
        addSplitViewItem(whiteItem)
        addSplitViewItem(blueItem)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

