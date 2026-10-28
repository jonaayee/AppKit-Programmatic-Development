//
//  ViewController.swift
//  ManipulatingOtherNSSplitViewItems
//
//  Created by Jonathan Amburgy on 10/15/26.
//

import Cocoa

class ViewController: NSSplitViewController {
    
    let firstVC = FirstViewController()
    let secondVC = SecondViewController()
    let thirdVC = ThirdViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstItem = NSSplitViewItem(viewController: firstVC)
        let secondItem = NSSplitViewItem(viewController: secondVC)
        let thirdItem = NSSplitViewItem(viewController: thirdVC)
        
        splitView.isVertical = true
        
        addSplitViewItem(firstItem)
        addSplitViewItem(secondItem)
        addSplitViewItem(thirdItem)

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

