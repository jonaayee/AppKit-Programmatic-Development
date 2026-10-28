//
//  ViewController.swift
//  NSStepper
//
//  Created by Jonathan Amburgy on 10/23/26.
//

import Cocoa

class ViewController: NSViewController {
    
    var incrementAmount: Double = 1
    
    var valueField = NSTextField()
    var incrementAmountControl = NSSegmentedControl(labels: ["1", "2", "4", "8", "16", "32", "64", "128", "256", "512", "1024",], trackingMode: .selectOne, target: nil, action: #selector(incrementAmountChanged))
    var stepper = NSStepper()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        valueField.placeholderString = "Number of Gigabytes"
        valueField.translatesAutoresizingMaskIntoConstraints = false
        
        incrementAmountControl.selectedSegment = 0
        incrementAmountControl.translatesAutoresizingMaskIntoConstraints = false
        
        stepper.minValue = 0
        stepper.maxValue = 1024 /* 1024 GB */ * 1024 // 1024 TB
        stepper.increment = incrementAmount
        stepper.target = nil
        stepper.action = #selector(stepperValueChanged)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(valueField)
        view.addSubview(incrementAmountControl)
        view.addSubview(stepper)
        
        NSLayoutConstraint.activate([
            stepper.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stepper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), // macOS sets a specific size, so no need to create a specific size
            
            valueField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            valueField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            valueField.trailingAnchor.constraint(equalTo: stepper.leadingAnchor, constant: -20),
            
            incrementAmountControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            incrementAmountControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            incrementAmountControl.topAnchor.constraint(equalTo: valueField.bottomAnchor, constant: 20)
        ])
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @objc private func incrementAmountChanged(_ sc: NSSegmentedCell) {
        incrementAmount = Double(sc.label(forSegment: sc.selectedSegment)!)!
        
        stepper.increment = incrementAmount
    }
    
    @objc private func stepperValueChanged(_ stepper: NSStepper?) {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        
        valueField.stringValue = formatter.string(from: NSNumber(value: stepper!.floatValue))!
    }

}

