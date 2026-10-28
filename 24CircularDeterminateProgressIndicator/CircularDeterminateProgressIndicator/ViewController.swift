//
//  ViewController.swift
//  CircularDeterminateProgressIndicator
//
//  Created by Jonathan Amburgy on 10/28/26.
//

import Cocoa

class ViewController: NSViewController {
    
    var progressView = NSProgressIndicator()
    var backButtonBar = NSButton(title: "Back", target: nil, action: nil)
    var forwardButtonBar = NSButton(title: "Forward", target: nil, action: nil)
    
    var progressViewIndeterminate = NSProgressIndicator()
    var progressViewCircular = NSProgressIndicator()
    var backButtonCircle = NSButton(title: "Back", target: nil, action: nil)
    var forwardButtonCircle = NSButton(title: "Forward", target: nil, action: nil)
    
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
        
        progressViewIndeterminate.translatesAutoresizingMaskIntoConstraints = false
        progressViewIndeterminate.sizeToFit()
        progressViewIndeterminate.style = .bar
        progressViewIndeterminate.isIndeterminate = true
        progressViewIndeterminate.startAnimation(nil) // need this to begin animatiom
        view.addSubview(progressViewIndeterminate)
        
        progressViewCircular.translatesAutoresizingMaskIntoConstraints = false
        progressViewCircular.doubleValue = 0.5
        progressViewCircular.minValue = 0
        progressViewCircular.maxValue = 1
        progressViewCircular.sizeToFit()
        progressViewCircular.style = .spinning // creates a circular value
        progressViewCircular.isIndeterminate = false
        view.addSubview(progressViewCircular)
        
        backButtonBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButtonBar)
        forwardButtonBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forwardButtonBar)
        
        backButtonBar.target = self
        backButtonBar.action = #selector(backBar)
        forwardButtonBar.target = self
        forwardButtonBar.action = #selector(forwardBar)
        
        backButtonCircle.translatesAutoresizingMaskIntoConstraints = false
        forwardButtonCircle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButtonCircle)
        view.addSubview(forwardButtonCircle)
        backButtonCircle.target = self
        backButtonCircle.action = #selector(backCircle)
        forwardButtonCircle.target = self
        forwardButtonCircle.action = #selector(forwardCircle)
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            progressView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            backButtonBar.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 40),
            backButtonBar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -40),
            forwardButtonBar.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 40),
            forwardButtonBar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 40),
            
            progressViewIndeterminate.topAnchor.constraint(equalTo: backButtonBar.bottomAnchor, constant: 50),
            progressViewIndeterminate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            progressViewIndeterminate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            progressViewCircular.topAnchor.constraint(equalTo: progressViewIndeterminate.bottomAnchor, constant: 50),
            progressViewCircular.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backButtonCircle.topAnchor.constraint(equalTo: progressViewCircular.bottomAnchor, constant: 40),
            backButtonCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -40),
            forwardButtonCircle.topAnchor.constraint(equalTo: progressViewCircular.bottomAnchor, constant: 40),
            forwardButtonCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 40)
        ])
    }
    
    @objc private func back(_ increment: NSProgressIndicator) {
        increment.increment(by: -0.05)
    }
    
    @objc private func forward(_ increment: NSProgressIndicator) {
        increment.increment(by: 0.05)
    }
    
    @objc private func backBar(_ sender: Any?) {
        back(progressView)
    }
    
    @objc private func forwardBar(_ sender: Any?) {
        forward(progressView)
    }
    
    @objc private func backCircle(_ sender: Any?) {
        back(progressViewCircular)
    }
    
    @objc private func forwardCircle(_ sender: Any?) {
        forward(progressViewCircular)
    }
    
}
