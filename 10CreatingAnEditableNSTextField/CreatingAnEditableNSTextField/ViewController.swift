//
//  ViewController.swift
//  CreatingAnEditableNSTextField
//
//  Created by Jonathan Amburgy on 10/8/26.
//

import Cocoa

class ViewController: NSViewController {
    
    var textField = NSTextField()
    var resultLabel = NSTextField(labelWithString: "Press button to show text from field.")
    var button = NSButton(title: "Show Text", target: nil, action: #selector(showTextClicked))
    var reverseCheck = NSButton(checkboxWithTitle: "Reverse Text", target: nil, action: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    private func configureUI() {
        // Constraint Deactivation
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        reverseCheck.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add Subview
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(reverseCheck)
        view.addSubview(resultLabel)
        
        // Adding Constraints
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10), // The constants are acting as padding
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            button.widthAnchor.constraint(equalToConstant: 100),
            textField.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            textField.heightAnchor.constraint(equalTo: button.heightAnchor),
            reverseCheck.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            reverseCheck.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            reverseCheck.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            resultLabel.topAnchor.constraint(equalTo: reverseCheck.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        // All these constraints play in the coordinate space, where 0,0 is the top left of the window
    }

    @objc
    private func showTextClicked() {
        // Checks to see if the value is empty to improve efficency
        if !textField.stringValue.isEmpty {
            let isChecked = reverseCheck.state == .on // can be on, off, or mixed
            
            if isChecked {
                resultLabel.stringValue = reverse(string: textField.stringValue)
            } else {
                resultLabel.stringValue = textField.stringValue
            }
        }
    }
    
    private func reverse(string: String) -> String {
        return String(string.reversed())
    }

}

