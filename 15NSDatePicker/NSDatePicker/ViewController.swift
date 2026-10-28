//
//  ViewController.swift
//  NSDatePicker
//
//  Created by Jonathan Amburgy on 10/19/26.
//

// With NSDatePicker, you can select a range, or a specific point in time

import Cocoa

class ViewController: NSViewController {
    
    var button = NSButton(title: "display date", target: nil, action: #selector(displayDate))
    var datePicker = NSDatePicker()
    var result = NSTextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureUI()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    private func configureUI() {
        button.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        result.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(datePicker)
        view.addSubview(button)
        view.addSubview(result)
        
        datePicker.datePickerStyle = .textFieldAndStepper // .clockAndCalendar style required for a range of dates
        datePicker.datePickerElements = .yearMonthDay // type of value
        
        datePicker.dateValue = Date()
        
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            result.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            result.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            result.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

    @objc private func displayDate() {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        
        result.stringValue = formatter.string(from: datePicker.dateValue)
    }

}

