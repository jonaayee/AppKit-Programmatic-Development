//
//  FirstViewController.swift
//  ManipulatingOtherNSSplitViewItems
//
//  Created by Jonathan Amburgy on 10/15/26.
//

import Cocoa

class FirstViewController: NSViewController {

    var firstView = NSView()
    
    var button = NSButton(title: "Change Background Colors", target: nil, action: #selector(changeBackgrounds))
    
    private let colors: [NSColor] = [
        .systemRed,
        .systemGreen,
        .systemBlue,
        .systemOrange,
        .systemPurple
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView.wantsLayer = true
        firstView.frame = view.bounds
        view.addSubview(firstView)
        configureButton()
        view.addSubview(button)
        

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    private func configureButton() {
        button.bezelColor = NSColor.systemGray
    }

    @objc private func getRandomColor() -> CGColor {
        let index = Int.random(in: 0..<colors.count)
        return colors[index].cgColor
    }
    
    @objc private func changeBackgrounds() {
        
        guard let parent = self.parent as? NSSplitViewController else { return }
        guard let secondVC = parent.splitViewItems[1].viewController as? SecondViewController else { return }
        guard let thirdVC = parent.splitViewItems[2].viewController as? ThirdViewController else { return }
        
        self.view.layer?.backgroundColor = getRandomColor()
        secondVC.view.layer?.backgroundColor = getRandomColor()
        thirdVC.view.layer?.backgroundColor = getRandomColor()
    }

}
