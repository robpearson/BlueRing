//
//  StatusMenuController.swift
//  BlueRing
//
//  Created by Robert Pearson on 11/2/17.
//  Copyright © 2017 Rob Pearson. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {

    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var projectView: ProjectView!
    var projectMenuItem: NSMenuItem!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        projectMenuItem = statusMenu.item(withTitle: "Project")
        projectMenuItem.view = projectView
        
        updateProject()
    }
    
    @IBAction func updateClicked(_ sender: Any) {
        updateProject()
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
    
    func updateProject() {
        let project = Project(id: "Projects-1", name: "Octofront", projectDescription: "Octopus public website", releasesByEnvironment: [ "dev" : ["1.2.1"], "test" : ["1.2.0"], "prod" : ["1.1.20"]])
        projectView.update(project: project)
    }
    
}
