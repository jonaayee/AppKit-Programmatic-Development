//
//  ViewController.swift
//  Vertical NSSlider
//
//  Created by Jonathan Amburgy on 10/27/26.
//

import Cocoa

class ViewController: NSViewController {
    
    var hSlider = NSSlider(
        value: 0.75,
        minValue: 0,
        maxValue: 1,
        target: nil,
        action: #selector(valueChanged)
    )
    
    var vSlider = NSSlider(
        value: 0.75,
        minValue: 0,
        maxValue: 1,
        target: nil,
        action: #selector(valueChanged)
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.black.cgColor
        
        configureUI()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    private func configureUI() {
        hSlider.isVertical = false
        hSlider.trackFillColor = .systemYellow
        hSlider.altIncrementValue = 0.01
        hSlider.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(hSlider)
        
        vSlider.isVertical = true // changes the slider to the vertical orientation
        vSlider.trackFillColor = .systemBlue
        vSlider.altIncrementValue = 0.01
        vSlider.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(vSlider)
        
        NSLayoutConstraint.activate([
            hSlider.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            hSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            hSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            vSlider.topAnchor.constraint(equalTo: hSlider.bottomAnchor, constant: 50),
            vSlider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            vSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func valueChanged(_ slider: NSSlider) {
        print(slider.doubleValue)
    }

}

