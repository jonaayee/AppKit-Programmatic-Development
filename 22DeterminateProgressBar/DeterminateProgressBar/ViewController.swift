//
//  ViewController.swift
//  DeterminateProgressBar
//
//  Created by Jonathan Amburgy on 10/27/26.
//

import Cocoa

class ViewController: NSViewController {
    
    /*
     There are multiple different types of progress indicators we can use, each has their own purposes
     - Determinate Progress Bar
     - Indeterminate Progress Bar
     - Circular Determinate Progress Indicator
     - Indeterminate Loading Indicator (aka activity spinner)
     */
    
    var progressView = NSProgressIndicator()
    var backButton = NSButton(title: "Back", target: nil, action: #selector(back))
    var forwardButton = NSButton(title: "Forward", target: nil, action: #selector(forward))

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
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.doubleValue = 0.5
        progressView.minValue = 0
        progressView.maxValue = 1
        progressView.sizeToFit()
        progressView.style = .bar
        progressView.isIndeterminate = false // stating it has a value
        view.addSubview(progressView)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forwardButton)
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            progressView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            backButton.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 40),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -40),
            forwardButton.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 40),
            forwardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 40)
        ])
    }
    
    @objc private func back() {
        progressView.increment(by: -0.05)
    }
    
    @objc private func forward() {
        progressView.increment(by: 0.05)
    }

}

