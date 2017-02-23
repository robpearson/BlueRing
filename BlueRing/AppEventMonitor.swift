//
//  AppEventMonitor.swift
//  BlueRing
//
//  Created by Robert Pearson on 23/2/17.
//  Copyright © 2017 Rob Pearson. All rights reserved.
//

import Cocoa

public class AppEventMonitor: NSObject {

    private var monitor: AnyObject?
    private let mask: NSEventMask
    private let handler: (NSEvent?) -> ()
    
    public init(mask: NSEventMask, handler: @escaping (NSEvent?) -> ()) {
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    public func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler) as AnyObject?
    }
    
    public func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
    
}
