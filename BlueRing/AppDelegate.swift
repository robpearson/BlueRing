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
    
    var appEventMonitor: AppEventMonitor?
    
    let appStatusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    let appPopover = NSPopover()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        if let button = appStatusItem.button {
            button.image = NSImage(named: "statusIcon")
            button.action = #selector(AppDelegate.togglePopover)
        }
            
        appPopover.behavior = .transient
        appPopover.contentViewController = ProjectViewController(nibName: "ProjectViewController", bundle: nil)
        
        appEventMonitor = AppEventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [unowned self] event in
            if self.appPopover.isShown {
                self.closePopover(sender: event)
            }
        }
        appEventMonitor?.start()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func showPopover(sender: AnyObject?) {
        if let button = appStatusItem.button {
            appPopover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
        appEventMonitor?.start()
    }
    
    func closePopover(sender: AnyObject?) {
        appPopover.performClose(sender)
        appEventMonitor?.stop()
    }
    
    public func togglePopover(sender: AnyObject?) {
        if appPopover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }

}

