//
//  AppDelegate.swift
//  TheBasicProjectStructure
//
//  Created by Jonathan Amburgy on 10/4/26.
//

import Cocoa
// Cocoa is a collection of frameworks such as AppKIT, foundation, and other macOS specific frameworks for macOS applications

@main
class AppDelegate: NSObject, NSApplicationDelegate { // Conforms to both NSObject, and NSApplicationDelegate with provides methods
    
    // Delegate: A class that impliments a specific protocol and provides specific implimentations for methods that can be used elsewhere
    
    func applicationDidFinishLaunching(_ aNotification: Notification) { // Runs when the application has finished launcing
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) { // Runs when the application is about to close
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool { // Returns a bool to allow/deny restorablity
        return true
    }


}

