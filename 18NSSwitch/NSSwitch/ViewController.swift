//
//  ViewController.swift
//  NSSwitch
//
//  Created by Jonathan Amburgy on 10/23/26.
//

import Cocoa

class ViewController: NSViewController {
    
    var disableAllWindowsPCs = NSButton(checkboxWithTitle: "Disable All Windows PCs", target: nil, action: nil)
    var disableAllWindowsPCsSwitch = NSSwitch() // Label must be created seperately
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        disableAllWindowsPCs.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(disableAllWindowsPCs)
        
        disableAllWindowsPCsSwitch.setAccessibilityLabel("Disable All Windows PCs on Planet Earth")
        disableAllWindowsPCsSwitch.translatesAutoresizingMaskIntoConstraints = false
        disableAllWindowsPCsSwitch.state = .on // .mixed doesn't really doesnt matter, as it cant be accessed normally
        view.addSubview(disableAllWindowsPCsSwitch)
        
        NSLayoutConstraint.activate([
            disableAllWindowsPCs.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            disableAllWindowsPCs.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            disableAllWindowsPCsSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            disableAllWindowsPCsSwitch.topAnchor.constraint(equalTo: disableAllWindowsPCs.bottomAnchor, constant: 20)
        ])
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

