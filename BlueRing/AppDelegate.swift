//
//  AppDelegate.swift
//  BlueRing
//
//  Created by Robert Pearson on 9/2/17.
//  Copyright © 2017 Rob Pearson. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let appStatusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    let appPopover = NSPopover()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        if let button = appStatusItem.button {
            button.image = NSImage(named: "statusIcon")
            button.action = #selector(AppDelegate.togglePopover)
        }
        
        appPopover.contentViewController = ProjectViewController(nibName: "ProjectViewController", bundle: nil)
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func showPopover(sender: AnyObject?) {
        if let button = appStatusItem.button {
            appPopover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func closePopover(sender: AnyObject?) {
        appPopover.performClose(sender)
    }
    
    public func togglePopover(sender: AnyObject?) {
        if appPopover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }

}

